# ICA Terraform Modules

These modules are meant to be an easy setup of the infrastructure needed in AWS, Microsoft Azure and GCP for exporting
resource events to allow ingestion in the Mia-Platform Data Catalog via the [Integration Connector Agent](https://github.com/mia-platform/integration-connector-agent).

## Usage

`aws`:

```hcl
module "aws" {
	source = "github.com/mia-platform/terraform-integration-connector-agent//modules/aws"

	cloudtrail_name = "awesome-cloudtrail-name"
	cloudtrail_bucket_name = "awesome-bucket-name"

	eventbridge_rule_name = "awesome-rule-name"
	sqs_queue_name = "awesome-queue-name"
}
```

`gcp`:

```hcl
module "gcp" {
	source = "github.com/mia-platform/terraform-integration-connector-agent//modules/google"

	pubsub_topic_name = "awesome-topic-name"
	cloud_asset_feed_id = "awesome-feed-id"
}
```

`azure`:

```hcl
module "azure" {
	source = "github.com/mia-platform/terraform-integration-connector-agent//modules/azurerm"

	resource_group = "awesome-resource-group"
	activity_log_diagnostic_setting_name = "awesome-diagnostic-setting-name"

	eventhub_namespace_name = "awesome-eventhub-namespace"
	eventhub_name = "awesome-eventhub-name"

	eventhub_checkpoint_storage_name = "awesome-storage-account-name"
}
```

## Examples

- [aws](./examples/aws): Setting up the resources and permissions for AWS
- [gcp](./examples/gcp/): Setting up the resources and permissions for GCP
- [azure](./examples/azure/): Setting up the resources and permissions for Microsoft Azure

## License

Apache 2 Licensed. See [LICENSE](./LICENSE) for full details.
