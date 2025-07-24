# GCP Module

The module will create the Cloud Asset Feed and PubSub topic needed for exporting the resource logs to the ICA.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 6.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 6.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_cloud_asset_project_feed.cloud_asset_feed](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_asset_project_feed) | resource |
| [google_pubsub_subscription.subscription](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_subscription) | resource |
| [google_pubsub_topic.cloud_asset_feed](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic) | resource |
| [google_pubsub_topic.cloud_asset_feed](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/pubsub_topic) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_asset_types"></a> [asset\_types](#input\_asset\_types) | List of asset types to include in the Cloud Asset feed. | `list(string)` | <pre>[<br/>  "storage.googleapis.com/Bucket",<br/>  "cloudfunctions.googleapis.com/Function",<br/>  "run.googleapis.com/DomainMapping",<br/>  "run.googleapis.com/Execution",<br/>  "run.googleapis.com/Job",<br/>  "run.googleapis.com/Revision",<br/>  "run.googleapis.com/Service",<br/>  "cloudfunctions.googleapis.com/CloudFunction"<br/>]</pre> | no |
| <a name="input_cloud_asset_feed_id"></a> [cloud\_asset\_feed\_id](#input\_cloud\_asset\_feed\_id) | The ID of the Cloud Asset feed. | `string` | n/a | yes |
| <a name="input_create_pubsub_subscription"></a> [create\_pubsub\_subscription](#input\_create\_pubsub\_subscription) | Flag to create a Pub/Sub subscription for Cloud Asset feed. | `bool` | `true` | no |
| <a name="input_create_pubsub_topic"></a> [create\_pubsub\_topic](#input\_create\_pubsub\_topic) | Flag to create a Pub/Sub topic for Cloud Asset feed. | `bool` | `true` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to apply to the created resources. | `map(string)` | `{}` | no |
| <a name="input_pubsub_topic_name"></a> [pubsub\_topic\_name](#input\_pubsub\_topic\_name) | The name of the Pub/Sub topic for Cloud Asset feed. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_pubsub_topic_id"></a> [pubsub\_topic\_id](#output\_pubsub\_topic\_id) | The ID of the Pub/Sub topic to use for the Cloud Asset feed. |
| <a name="output_pubsub_topic_subscription_id"></a> [pubsub\_topic\_subscription\_id](#output\_pubsub\_topic\_subscription\_id) | The ID of the Pub/Sub subscription created for the Cloud Asset feed. |
| <a name="output_pubsub_topic_subscription_name"></a> [pubsub\_topic\_subscription\_name](#output\_pubsub\_topic\_subscription\_name) | The Name of the Pub/Sub subscription created for the Cloud Asset feed. |
<!-- END_TF_DOCS -->
