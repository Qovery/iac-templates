## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_sqs_queue.dead_letter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_content_based_deduplication"></a> [content\_based\_deduplication](#input\_content\_based\_deduplication) | Enable content-based deduplication for FIFO queues | `bool` | `false` | no |
| <a name="input_delay_seconds"></a> [delay\_seconds](#input\_delay\_seconds) | Delay in seconds for message delivery | `number` | `0` | no |
| <a name="input_dlq_message_retention_seconds"></a> [dlq\_message\_retention\_seconds](#input\_dlq\_message\_retention\_seconds) | Message retention period for dead letter queue | `number` | `1209600` | no |
| <a name="input_enable_dead_letter_queue"></a> [enable\_dead\_letter\_queue](#input\_enable\_dead\_letter\_queue) | Enable dead letter queue for failed messages | `bool` | `true` | no |
| <a name="input_fifo_queue"></a> [fifo\_queue](#input\_fifo\_queue) | Boolean designating a FIFO queue | `bool` | `false` | no |
| <a name="input_kms_data_key_reuse_period_seconds"></a> [kms\_data\_key\_reuse\_period\_seconds](#input\_kms\_data\_key\_reuse\_period\_seconds) | Length of time KMS data key is reused | `number` | `300` | no |
| <a name="input_kms_master_key_id"></a> [kms\_master\_key\_id](#input\_kms\_master\_key\_id) | ID of AWS KMS key for encryption (optional) | `string` | `null` | no |
| <a name="input_max_message_size"></a> [max\_message\_size](#input\_max\_message\_size) | Maximum message size in bytes | `number` | `262144` | no |
| <a name="input_max_receive_count"></a> [max\_receive\_count](#input\_max\_receive\_count) | Maximum receives before sending to DLQ | `number` | `3` | no |
| <a name="input_message_retention_seconds"></a> [message\_retention\_seconds](#input\_message\_retention\_seconds) | Number of seconds to retain messages | `number` | `345600` | no |
| <a name="input_queue_name"></a> [queue\_name](#input\_queue\_name) | Name of the SQS queue | `string` | n/a | yes |
| <a name="input_queue_policy"></a> [queue\_policy](#input\_queue\_policy) | JSON policy for the queue (optional) | `string` | `null` | no |
| <a name="input_receive_wait_time_seconds"></a> [receive\_wait\_time\_seconds](#input\_receive\_wait\_time\_seconds) | Time for which ReceiveMessage waits for a message | `number` | `0` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region for the SQS queue | `string` | `"eu-west-3"` | no |
| <a name="input_sqs_managed_sse_enabled"></a> [sqs\_managed\_sse\_enabled](#input\_sqs\_managed\_sse\_enabled) | Enable SQS managed server-side encryption | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags for the SQS queue | `map(string)` | `{}` | no |
| <a name="input_visibility_timeout_seconds"></a> [visibility\_timeout\_seconds](#input\_visibility\_timeout\_seconds) | Visibility timeout for the queue | `number` | `30` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dead_letter_queue_arn"></a> [dead\_letter\_queue\_arn](#output\_dead\_letter\_queue\_arn) | ARN of the dead letter queue |
| <a name="output_dead_letter_queue_id"></a> [dead\_letter\_queue\_id](#output\_dead\_letter\_queue\_id) | URL of the dead letter queue |
| <a name="output_dead_letter_queue_url"></a> [dead\_letter\_queue\_url](#output\_dead\_letter\_queue\_url) | URL of the dead letter queue |
| <a name="output_queue_arn"></a> [queue\_arn](#output\_queue\_arn) | ARN of the SQS queue |
| <a name="output_queue_id"></a> [queue\_id](#output\_queue\_id) | URL of the SQS queue |
| <a name="output_queue_name"></a> [queue\_name](#output\_queue\_name) | Name of the SQS queue |
| <a name="output_queue_url"></a> [queue\_url](#output\_queue\_url) | URL of the SQS queue |
