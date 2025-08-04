# Microsoft Azure Example

Configuration in this example will create the resources needed by the ICA and a service account with the necessary
permission that can be used by the application.

## Usage

To run this example you need to execute:

```bash
terraform init
terraform plan
terraform apply
```

Run `terraform destroy` when you don't need these resources.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 3.4.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.38.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 3.4.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.38.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_activity_log"></a> [activity\_log](#module\_activity\_log) | github.com/mia-platform/terraform-integration-connector-agent//modules/azurerm | n/a |

## Resources

| Name | Type |
|------|------|
| [azuread_application_registration.activity_log](https://registry.terraform.io/providers/hashicorp/azuread/3.4.0/docs/resources/application_registration) | resource |
| [azuread_service_principal.activity_log](https://registry.terraform.io/providers/hashicorp/azuread/3.4.0/docs/resources/service_principal) | resource |
| [azurerm_resource_group.example](https://registry.terraform.io/providers/hashicorp/azurerm/4.38.1/docs/resources/resource_group) | resource |
| [azurerm_role_assignment.activity_log_checkpoint_storage](https://registry.terraform.io/providers/hashicorp/azurerm/4.38.1/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.activity_log_eventhub_reader](https://registry.terraform.io/providers/hashicorp/azurerm/4.38.1/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.activity_log_resources_reader](https://registry.terraform.io/providers/hashicorp/azurerm/4.38.1/docs/resources/role_assignment) | resource |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/4.38.1/docs/data-sources/subscription) | data source |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
