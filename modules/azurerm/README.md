# Microsoft Azure Module

The module will create the Monitor Diagnostic setting, EventHub and Checkpoint storage needed for exporting the resource
logs to the ICA.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 4.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 4.12 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_eventhub.activity_logs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub) | resource |
| [azurerm_eventhub_namespace.namespace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace) | resource |
| [azurerm_eventhub_namespace_authorization_rule.rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace_authorization_rule) | resource |
| [azurerm_monitor_diagnostic_setting.activity_logs_export](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_storage_account.checkpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.checkpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [azurerm_eventhub_namespace.namespace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/eventhub_namespace) | data source |
| [azurerm_storage_account.checkpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activity_log_diagnostic_setting_name"></a> [activity\_log\_diagnostic\_setting\_name](#input\_activity\_log\_diagnostic\_setting\_name) | The name of the diagnostic setting for activity logs. | `string` | `"mia-platform-activitylogs-export"` | no |
| <a name="input_create_checkpoint_storage"></a> [create\_checkpoint\_storage](#input\_create\_checkpoint\_storage) | Flag to create a storage account for checkpointing in the Event Hub. | `bool` | `true` | no |
| <a name="input_create_eventhub_namespace"></a> [create\_eventhub\_namespace](#input\_create\_eventhub\_namespace) | Flag to create an Event Hub namespace. | `bool` | `true` | no |
| <a name="input_eventhub_checkpoint_container_name"></a> [eventhub\_checkpoint\_container\_name](#input\_eventhub\_checkpoint\_container\_name) | The name of the blob container used for checkpointing in the Event Hub | `string` | n/a | yes |
| <a name="input_eventhub_checkpoint_storage_name"></a> [eventhub\_checkpoint\_storage\_name](#input\_eventhub\_checkpoint\_storage\_name) | The name of the storage account used for checkpointing in the Event Hub | `string` | n/a | yes |
| <a name="input_eventhub_checkpoint_storage_replication_type"></a> [eventhub\_checkpoint\_storage\_replication\_type](#input\_eventhub\_checkpoint\_storage\_replication\_type) | The replication type for the storage account used for checkpointing in the Event Hub. | `string` | `"LRS"` | no |
| <a name="input_eventhub_checkpoint_storage_tier"></a> [eventhub\_checkpoint\_storage\_tier](#input\_eventhub\_checkpoint\_storage\_tier) | The SKU for the storage account used for checkpointing in the Event Hub. | `string` | `"Standard"` | no |
| <a name="input_eventhub_name"></a> [eventhub\_name](#input\_eventhub\_name) | The name of the Event Hub to which activity logs will be sent. | `string` | n/a | yes |
| <a name="input_eventhub_namespace_capacity"></a> [eventhub\_namespace\_capacity](#input\_eventhub\_namespace\_capacity) | The capacity for the Event Hub namespace. | `number` | `1` | no |
| <a name="input_eventhub_namespace_name"></a> [eventhub\_namespace\_name](#input\_eventhub\_namespace\_name) | The namespace of the Event Hub to which activity logs will be sent. | `string` | n/a | yes |
| <a name="input_eventhub_namespace_sku"></a> [eventhub\_namespace\_sku](#input\_eventhub\_namespace\_sku) | The SKU for the Event Hub namespace. | `string` | `"Standard"` | no |
| <a name="input_eventhub_partition_count"></a> [eventhub\_partition\_count](#input\_eventhub\_partition\_count) | The number of partitions for the Event Hub. | `number` | `1` | no |
| <a name="input_eventhub_retention"></a> [eventhub\_retention](#input\_eventhub\_retention) | The message retention period for the Event Hub in days. | `number` | `1` | no |
| <a name="input_location"></a> [location](#input\_location) | The location where the resources will be created. | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | The resource group where the resources will be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the created resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_checkpoint_container_id"></a> [checkpoint\_container\_id](#output\_checkpoint\_container\_id) | The ID of the Event Hub consumer checkpoint blob container |
| <a name="output_checkpoint_storage_account_id"></a> [checkpoint\_storage\_account\_id](#output\_checkpoint\_storage\_account\_id) | The ID of the Event Hub consumer checkpoint storage account |
| <a name="output_eventhub_id"></a> [eventhub\_id](#output\_eventhub\_id) | The ID of the Event Hub created for Activity Log. |
<!-- END_TF_DOCS -->
