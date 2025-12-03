## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.100.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_elasticache_replication_group.redis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group) | resource |
| [aws_elasticache_subnet_group.redis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_at_rest_encryption_enabled"></a> [at\_rest\_encryption\_enabled](#input\_at\_rest\_encryption\_enabled) | Enable encryption at rest | `bool` | `true` | no |
| <a name="input_auth_token"></a> [auth\_token](#input\_auth\_token) | AUTH token for Redis (required if transit\_encryption\_enabled is true) | `string` | `null` | no |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | Enable automatic minor version upgrades | `bool` | `true` | no |
| <a name="input_automatic_failover_enabled"></a> [automatic\_failover\_enabled](#input\_automatic\_failover\_enabled) | Enable automatic failover for the replication group | `bool` | `true` | no |
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | Identifier for the ElastiCache replication group | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Description for the ElastiCache replication group | `string` | `"Redis cluster managed by Qovery"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | Redis engine version | `string` | `"7.1"` | no |
| <a name="input_log_destination"></a> [log\_destination](#input\_log\_destination) | Name of CloudWatch log group for Redis logs | `string` | `null` | no |
| <a name="input_log_destination_type"></a> [log\_destination\_type](#input\_log\_destination\_type) | Destination type for logs (cloudwatch-logs or kinesis-firehose) | `string` | `"cloudwatch-logs"` | no |
| <a name="input_log_format"></a> [log\_format](#input\_log\_format) | Log format (json or text) | `string` | `"json"` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | Weekly time range for maintenance | `string` | `"sun:05:00-sun:07:00"` | no |
| <a name="input_multi_az_enabled"></a> [multi\_az\_enabled](#input\_multi\_az\_enabled) | Enable Multi-AZ support | `bool` | `true` | no |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | Instance class for cache nodes | `string` | `"cache.t3.micro"` | no |
| <a name="input_num_cache_clusters"></a> [num\_cache\_clusters](#input\_num\_cache\_clusters) | Number of cache clusters (nodes) in the replication group | `number` | `2` | no |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | Name of the parameter group to associate | `string` | `"default.redis7"` | no |
| <a name="input_port"></a> [port](#input\_port) | Port number on which the cache accepts connections | `number` | `6379` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region for the ElastiCache cluster | `string` | `"eu-west-3"` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | List of security group IDs | `list(string)` | `[]` | no |
| <a name="input_snapshot_retention_limit"></a> [snapshot\_retention\_limit](#input\_snapshot\_retention\_limit) | Number of days to retain automatic snapshots | `number` | `5` | no |
| <a name="input_snapshot_window"></a> [snapshot\_window](#input\_snapshot\_window) | Daily time range for automatic snapshots | `string` | `"03:00-05:00"` | no |
| <a name="input_subnet_group_name"></a> [subnet\_group\_name](#input\_subnet\_group\_name) | Name of the cache subnet group. If not provided, one will be created | `string` | `null` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of VPC subnet IDs for the cache subnet group | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags for the ElastiCache resources | `map(string)` | `{}` | no |
| <a name="input_transit_encryption_enabled"></a> [transit\_encryption\_enabled](#input\_transit\_encryption\_enabled) | Enable encryption in transit | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_enabled"></a> [cluster\_enabled](#output\_cluster\_enabled) | Indicates if cluster mode is enabled |
| <a name="output_member_clusters"></a> [member\_clusters](#output\_member\_clusters) | List of member cluster IDs |
| <a name="output_port"></a> [port](#output\_port) | Port number on which the Redis cluster accepts connections |
| <a name="output_primary_endpoint_address"></a> [primary\_endpoint\_address](#output\_primary\_endpoint\_address) | Address of the primary endpoint |
| <a name="output_reader_endpoint_address"></a> [reader\_endpoint\_address](#output\_reader\_endpoint\_address) | Address of the reader endpoint |
| <a name="output_replication_group_arn"></a> [replication\_group\_arn](#output\_replication\_group\_arn) | ARN of the ElastiCache replication group |
| <a name="output_replication_group_id"></a> [replication\_group\_id](#output\_replication\_group\_id) | ID of the ElastiCache replication group |
