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

data "azurerm_subscription" "current" {}

resource "azurerm_eventhub_namespace" "namespace" {
  count = var.create_eventhub_namespace ? 1 : 0

  name                = var.eventhub_namespace_name
  location            = var.location
  resource_group_name = var.resource_group

  sku      = var.eventhub_namespace_sku
  capacity = var.eventhub_namespace_capacity

  tags = var.tags
}

data "azurerm_eventhub_namespace" "namespace" {
  count = var.create_eventhub_namespace ? 0 : 1

  name                = var.eventhub_namespace_name
  resource_group_name = var.resource_group
}

resource "azurerm_eventhub" "activity_logs" {
  name         = var.eventhub_name
  namespace_id = local.eventhub_namespace_id
  status       = "Active"


  message_retention = var.eventhub_retention
  partition_count   = var.eventhub_partition_count
}

resource "azurerm_eventhub_namespace_authorization_rule" "rule" {
  name                = "ActivtyLogsAuthorizationRule"
  namespace_name      = local.eventhub_namespace_name
  resource_group_name = var.resource_group

  send   = true
  listen = false
  manage = false
}

resource "azurerm_monitor_diagnostic_setting" "activity_logs_export" {
  name               = var.activity_log_diagnostic_setting_name
  target_resource_id = data.azurerm_subscription.current.id

  eventhub_authorization_rule_id = azurerm_eventhub_namespace_authorization_rule.rule.id
  eventhub_name                  = azurerm_eventhub.activity_logs.name

  enabled_log {
    category = "Administrative"
  }
}

resource "azurerm_storage_account" "checkpoint" {
  count = var.create_eventhub_namespace ? 1 : 0

  name                     = var.eventhub_checkpoint_storage_name
  resource_group_name      = var.resource_group
  location                 = var.location
  account_tier             = var.eventhub_checkpoint_storage_tier
  account_replication_type = var.eventhub_checkpoint_storage_replication_type

  tags = var.tags
}

data "azurerm_storage_account" "checkpoint" {
  count = var.create_eventhub_namespace ? 0 : 1

  name                = var.eventhub_checkpoint_storage_name
  resource_group_name = var.resource_group
}

resource "azurerm_storage_container" "checkpoint" {
  name                  = var.eventhub_checkpoint_container_name
  storage_account_id    = local.eventhub_checkpoint_storage_id
  container_access_type = "private"
}
