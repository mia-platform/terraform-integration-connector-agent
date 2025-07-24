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

output "pubsub_topic_id" {
  description = "The ID of the Pub/Sub topic to use for the Cloud Asset feed."
  value       = local.pubsub_topic_id
}

output "pubsub_topic_subscription_id" {
  description = "The ID of the Pub/Sub subscription created for the Cloud Asset feed."
  value       = var.create_pubsub_subscription ? google_pubsub_subscription.subscription[0].id : null
}

output "pubsub_topic_subscription_name" {
  description = "The Name of the Pub/Sub subscription created for the Cloud Asset feed."
  value       = var.create_pubsub_subscription ? google_pubsub_subscription.subscription[0].name : null
}
