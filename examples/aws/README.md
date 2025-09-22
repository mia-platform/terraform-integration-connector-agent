# AWS Example

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
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 6.14.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.14.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudtrail"></a> [cloudtrail](#module\_cloudtrail) | github.com/mia-platform/terraform-integration-connector-agent//modules/aws | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_user.export_user](https://registry.terraform.io/providers/hashicorp/aws/6.14.0/docs/resources/iam_user) | resource |
| [aws_iam_user_policy.export_user_policy](https://registry.terraform.io/providers/hashicorp/aws/6.14.0/docs/resources/iam_user_policy) | resource |
| [aws_iam_policy_document.export_user_policy](https://registry.terraform.io/providers/hashicorp/aws/6.14.0/docs/data-sources/iam_policy_document) | data source |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
