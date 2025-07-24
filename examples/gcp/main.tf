# Copyright Mia srl
# SPDX-License-Identifier: Apache-2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

data "google_project" "current" {}

resource "google_project_service" "cloud_asset" {
  service = "cloudasset.googleapis.com"
  project = data.google_project.current.project_id

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_on_destroy = false
}

module "cloud_asset" {
  source = "github.com/mia-platform/terraform-integration-connector-agent//modules/google"

  cloud_asset_feed_id = "mia-platform-resources-export"
  pubsub_topic_name   = "mia-platform-resources-export"

  asset_types = [
    "storage.googleapis.com/Bucket",
    "cloudfunctions.googleapis.com/Function",
    "run.googleapis.com/DomainMapping",
    "run.googleapis.com/Execution",
    "run.googleapis.com/Job",
    "run.googleapis.com/Revision",
    "run.googleapis.com/Service",
    "cloudfunctions.googleapis.com/CloudFunction",
  ]

  depends_on = [
    google_project_service.cloud_asset,
  ]
}

resource "google_service_account" "cloud_asset_service_account" {
  account_id   = "mia-platform-resources-export"
  display_name = "Mia Platform Resources Export Service Account"
}

resource "google_pubsub_subscription_iam_member" "editor" {
  for_each = toset([
    "roles/pubsub.viewer",
    "roles/pubsub.subscriber",
  ])

  subscription = module.cloud_asset.pubsub_topic_subscription_name
  role         = each.value
  member       = "serviceAccount:${google_service_account.cloud_asset_service_account.email}"
}

resource "google_project_iam_member" "project" {
  project = data.google_project.current.project_id
  role    = "roles/viewer"
  member  = "serviceAccount:${google_service_account.cloud_asset_service_account.email}"
}
