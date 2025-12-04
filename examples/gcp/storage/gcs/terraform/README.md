## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 5.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 5.0 |
| <a name="provider_random"></a> [random](#provider\_random) | ~> 3.6 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_storage_bucket.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_iam_member.members](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |
| [random_id.bucket_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Base name of the Cloud Storage bucket | `string` | n/a | yes |
| <a name="input_cors_rules"></a> [cors\_rules](#input\_cors\_rules) | CORS configuration | <pre>list(object({<br>    origin          = list(string)<br>    method          = list(string)<br>    response_header = list(string)<br>    max_age_seconds = number<br>  }))</pre> | `[]` | no |
| <a name="input_encryption_default_kms_key_name"></a> [encryption\_default\_kms\_key\_name](#input\_encryption\_default\_kms\_key\_name) | KMS key name for default encryption (optional) | `string` | `null` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Allow bucket deletion even when not empty | `bool` | `false` | no |
| <a name="input_iam_members"></a> [iam\_members](#input\_iam\_members) | IAM members to grant access to the bucket | <pre>map(object({<br>    role   = string<br>    member = string<br>  }))</pre> | `{}` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Additional labels for the bucket | `map(string)` | `{}` | no |
| <a name="input_lifecycle_rules"></a> [lifecycle\_rules](#input\_lifecycle\_rules) | List of lifecycle rules | <pre>list(object({<br>    action = object({<br>      type          = string<br>      storage_class = optional(string)<br>    })<br>    condition = object({<br>      age                   = optional(number)<br>      created_before        = optional(string)<br>      with_state            = optional(string)<br>      matches_storage_class = optional(list(string))<br>      num_newer_versions    = optional(number)<br>    })<br>  }))</pre> | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | Bucket location (region or multi-region) | `string` | `"EU"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | GCP project ID | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | GCP region | `string` | `"europe-west1"` | no |
| <a name="input_storage_class"></a> [storage\_class](#input\_storage\_class) | Storage class (STANDARD, NEARLINE, COLDLINE, ARCHIVE) | `string` | `"STANDARD"` | no |
| <a name="input_uniform_bucket_level_access"></a> [uniform\_bucket\_level\_access](#input\_uniform\_bucket\_level\_access) | Enable uniform bucket-level access | `bool` | `true` | no |
| <a name="input_versioning_enabled"></a> [versioning\_enabled](#input\_versioning\_enabled) | Enable object versioning | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_location"></a> [bucket\_location](#output\_bucket\_location) | Location of the Cloud Storage bucket |
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | Name of the Cloud Storage bucket |
| <a name="output_bucket_self_link"></a> [bucket\_self\_link](#output\_bucket\_self\_link) | Self link of the Cloud Storage bucket |
| <a name="output_bucket_storage_class"></a> [bucket\_storage\_class](#output\_bucket\_storage\_class) | Storage class of the bucket |
| <a name="output_bucket_url"></a> [bucket\_url](#output\_bucket\_url) | URL of the Cloud Storage bucket |
