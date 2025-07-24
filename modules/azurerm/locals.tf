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
  eventhub_namespace_name = var.create_eventhub_namespace ? azurerm_eventhub_namespace.namespace[0].name : data.azurerm_eventhub_namespace.namespace[0].name
  eventhub_namespace_id   = var.create_eventhub_namespace ? azurerm_eventhub_namespace.namespace[0].id : data.azurerm_eventhub_namespace.namespace[0].id

  eventhub_checkpoint_storage_id = var.create_checkpoint_storage ? azurerm_storage_account.checkpoint[0].id : data.azurerm_storage_account.checkpoint[0].id
}
