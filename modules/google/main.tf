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

resource "google_pubsub_topic" "cloud_asset_feed" {
  count = var.create_pubsub_topic ? 1 : 0

  name   = var.pubsub_topic_name
  labels = var.labels
}

data "google_pubsub_topic" "cloud_asset_feed" {
  count = var.create_pubsub_topic ? 0 : 1

  name = var.pubsub_topic_name
}

resource "google_pubsub_subscription" "subscription" {
  count = var.create_pubsub_topic ? 1 : 0

  name                 = "${var.pubsub_topic_name}-subscription"
  topic                = local.pubsub_topic_id
  ack_deadline_seconds = 15

  message_retention_duration = "604800s"
  expiration_policy {
    ttl = "2678400s"
  }

  labels = var.labels
}

resource "google_cloud_asset_project_feed" "cloud_asset_feed" {
  feed_id      = var.cloud_asset_feed_id
  content_type = "RESOURCE"

  asset_types = var.asset_types

  feed_output_config {
    pubsub_destination {
      topic = local.pubsub_topic_id
    }
  }
}
