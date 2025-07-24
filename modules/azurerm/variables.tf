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

variable "activity_log_diagnostic_setting_name" {
  description = "The name of the diagnostic setting for activity logs."
  type        = string
  default     = "mia-platform-activitylogs-export"
}

variable "location" {
  description = "The location where the resources will be created."
  type        = string
}

variable "resource_group" {
  description = "The resource group where the resources will be created."
  type        = string
}

variable "eventhub_namespace_name" {
  description = "The namespace of the Event Hub to which activity logs will be sent."
  type        = string
}

variable "create_eventhub_namespace" {
  description = "Flag to create an Event Hub namespace."
  type        = bool
  default     = true
}

variable "eventhub_namespace_sku" {
  description = "The SKU for the Event Hub namespace."
  type        = string
  default     = "Standard"
}

variable "eventhub_namespace_capacity" {
  description = "The capacity for the Event Hub namespace."
  type        = number
  default     = 1
}

variable "eventhub_name" {
  description = "The name of the Event Hub to which activity logs will be sent."
  type        = string
}

variable "eventhub_retention" {
  description = "The message retention period for the Event Hub in days."
  type        = number
  default     = 1
}

variable "eventhub_partition_count" {
  description = "The number of partitions for the Event Hub."
  type        = number
  default     = 1

}

variable "eventhub_checkpoint_storage_name" {
  description = "The name of the storage account used for checkpointing in the Event Hub"
  type        = string
}

variable "create_checkpoint_storage" {
  description = "Flag to create a storage account for checkpointing in the Event Hub."
  type        = bool
  default     = true
}

variable "eventhub_checkpoint_container_name" {
  description = "The name of the blob container used for checkpointing in the Event Hub"
  type        = string
}

variable "eventhub_checkpoint_storage_tier" {
  description = "The SKU for the storage account used for checkpointing in the Event Hub."
  type        = string
  default     = "Standard"
}

variable "eventhub_checkpoint_storage_replication_type" {
  description = "The replication type for the storage account used for checkpointing in the Event Hub."
  type        = string
  default     = "LRS"
}

variable "tags" {
  description = "A map of tags to assign to the created resources."
  type        = map(string)
  default     = {}
}
