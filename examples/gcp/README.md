# GCP Example

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
| <a name="requirement_google"></a> [google](#requirement\_google) | 6.45.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.45.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloud_asset"></a> [cloud\_asset](#module\_cloud\_asset) | github.com/mia-platform/terraform-integration-connector-agent//modules/google | n/a |

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.project](https://registry.terraform.io/providers/hashicorp/google/6.45.0/docs/resources/project_iam_member) | resource |
| [google_project_service.cloud_asset](https://registry.terraform.io/providers/hashicorp/google/6.45.0/docs/resources/project_service) | resource |
| [google_pubsub_subscription_iam_member.editor](https://registry.terraform.io/providers/hashicorp/google/6.45.0/docs/resources/pubsub_subscription_iam_member) | resource |
| [google_service_account.cloud_asset_service_account](https://registry.terraform.io/providers/hashicorp/google/6.45.0/docs/resources/service_account) | resource |
| [google_project.current](https://registry.terraform.io/providers/hashicorp/google/6.45.0/docs/data-sources/project) | data source |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
