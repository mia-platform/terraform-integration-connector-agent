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

output "eventhub_id" {
  description = "The ID of the Event Hub created for Activity Log."
  value       = local.eventhub_namespace_id
}

output "checkpoint_storage_account_id" {
  description = "The ID of the Event Hub consumer checkpoint storage account"
  value       = local.eventhub_checkpoint_storage_id
}

output "checkpoint_container_id" {
  description = "The ID of the Event Hub consumer checkpoint blob container"
  value       = azurerm_storage_container.checkpoint.id
}
