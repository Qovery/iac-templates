# Google Filestore (Cloud Filestore) - Terraform Example

This example provisions a Google Cloud Filestore instance using Terraform.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement_google) | `~> 7.0` |

## Providers

| Name | Version |
|------|---------|
| google | `~> 7.0` |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [`google_filestore_instance.main`](examples/gcp/storage/filestore/terraform/main.tf) | resource |
| [`random_id.filestore_name_suffix`](examples/gcp/storage/filestore/terraform/main.tf) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_id"></a> [project_id](#input_project_id) | GCP project ID | `string` | `null` | no |
| <a name="input_location"></a> [location](#input_location) | GCP zone or region (for ENTERPRISE tier) for the Filestore instance | `string` | `"europe-west1-b"` | no |
| <a name="input_instance_name"></a> [instance_name](#input_instance_name) | Name of the Filestore instance | `string` | n/a | yes |
| <a name="input_tier"></a> [tier](#input_tier) | Filestore tier (e.g. STANDARD, PREMIUM, BASIC_HDD, BASIC_SSD) | `string` | `"STANDARD"` | no |
| <a name="input_file_shares"></a> [file_shares](#input_file_shares) | List of file shares to create. Each object must contain name and capacity_gb. | `list(object({name = string, capacity_gb = number}))` | `[{name = "vol1", capacity_gb = 1024}]` | no |
| <a name="input_networks"></a> [networks](#input_networks) | List of network configurations for the instance. Each object may contain network, modes, reserved_ip_range. | `list(object({network = string, modes = optional(list(string)), reserved_ip_range = optional(string)}))` | `[]` | no |
| <a name="input_labels"></a> [labels](#input_labels) | Labels to apply to the Filestore instance | `map(string)` | `{}` | no |
| <a name="input_description"></a> [description](#input_description) | Description for the Filestore instance | `string` | `null` | no |
| <a name="input_deletion_protection"></a> [deletion_protection](#input_deletion_protection) | Enable deletion protection | `bool` | `false` | no |
| <a name="input_encryption_default_kms_key_name"></a> [encryption_default_kms_key_name](#input_encryption_default_kms_key_name) | KMS key name for default encryption (optional) | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_id"></a> [instance_id](#output_instance_id) | ID of the Filestore instance |
| <a name="output_instance_name"></a> [instance_name](#output_instance_name) | Name of the Filestore instance |
| <a name="output_tier"></a> [tier](#output_tier) | Filestore tier |
| <a name="output_file_shares"></a> [file_shares](#output_file_shares) | List of file shares (name and capacity_gb) |
| <a name="output_ip_addresses"></a> [ip_addresses](#output_ip_addresses) | Flattened list of IP addresses assigned to the instance networks |
| <a name="output_networks"></a> [networks](#output_networks) | Network blocks for the instance |

## Notes

- The example uses a random suffix resource [`random_id.filestore_name_suffix`](examples/gcp/storage/filestore/terraform/main.tf) to create unique instance names.
- Labels are merged with a default `created_by = "qovery-demo"` in [`main.tf`](examples/gcp/storage/filestore/terraform/main.tf).
- The lock file is present and pins provider versions: see [.terraform.lock.hcl](examples/gcp/storage/filestore/terraform/.terraform.lock.hcl).

## References

- Terraform provider: https://registry.terraform.io/providers/hashicorp/google
- Resource docs: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/filestore_instance