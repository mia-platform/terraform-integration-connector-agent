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

locals {
  location = "West Europe"
}

data "azurerm_subscription" "current" {}

resource "azurerm_resource_group" "example" {
  name     = "example-group"
  location = local.location
}

module "activity_log" {
  source = "github.com/mia-platform/terraform-integration-connector-agent//modules/azurerm"

  location       = local.location
  resource_group = azurerm_resource_group.example.name

  eventhub_namespace_name = "example-eventhub-namespace"
  eventhub_name           = "example-eventhub"

  eventhub_checkpoint_storage_name   = "examplecheckpoint"
  eventhub_checkpoint_container_name = "checkpointcontainer"
}

resource "azuread_application_registration" "activity_log" {
  display_name = "ActivityLogApp"
}

resource "azuread_service_principal" "activity_log" {
  client_id = azuread_application_registration.activity_log.client_id
}

resource "azurerm_role_assignment" "activity_log_resources_reader" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Reader"
  principal_id         = azuread_service_principal.activity_log.object_id
}

resource "azurerm_role_assignment" "activity_log_eventhub_reader" {
  scope                = module.activity_log.eventhub_id
  role_definition_name = "Azure Event Hubs Data Receiver"
  principal_id         = azuread_service_principal.activity_log.object_id
}

resource "azurerm_role_assignment" "activity_log_checkpoint_storage" {
  scope                = module.activity_log.checkpoint_container_id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = azuread_service_principal.activity_log.object_id
}
