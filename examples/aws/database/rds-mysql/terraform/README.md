## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |
| <a name="provider_random"></a> [random](#provider\_random) | ~> 3.6 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.mysql](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [random_password.db_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage) | Allocated storage in GB | `number` | `20` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | Backup retention period in days | `number` | `7` | no |
| <a name="input_backup_window"></a> [backup\_window](#input\_backup\_window) | Preferred backup window | `string` | `"03:00-04:00"` | no |
| <a name="input_db_identifier"></a> [db\_identifier](#input\_db\_identifier) | Identifier for the RDS instance | `string` | n/a | yes |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | Name of the database to create | `string` | `"mydb"` | no |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | DB subnet group name | `string` | `null` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Enable deletion protection | `bool` | `false` | no |
| <a name="input_enabled_cloudwatch_logs_exports"></a> [enabled\_cloudwatch\_logs\_exports](#input\_enabled\_cloudwatch\_logs\_exports) | List of log types to export to CloudWatch | `list(string)` | <pre>[<br>  "error",<br>  "general",<br>  "slowquery"<br>]</pre> | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | MySQL engine version | `string` | `"8.0.35"` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | Instance class for the RDS instance | `string` | `"db.t3.micro"` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | Preferred maintenance window | `string` | `"mon:04:00-mon:05:00"` | no |
| <a name="input_master_username"></a> [master\_username](#input\_master\_username) | Master username for the database | `string` | `"admin"` | no |
| <a name="input_max_allocated_storage"></a> [max\_allocated\_storage](#input\_max\_allocated\_storage) | Maximum allocated storage for autoscaling in GB | `number` | `100` | no |
| <a name="input_multi_az"></a> [multi\_az](#input\_multi\_az) | Enable Multi-AZ deployment | `bool` | `false` | no |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | Name of the DB parameter group to associate | `string` | `null` | no |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | Make the RDS instance publicly accessible | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region for the RDS instance | `string` | `"eu-west-3"` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | Skip final snapshot when destroying | `bool` | `true` | no |
| <a name="input_storage_encrypted"></a> [storage\_encrypted](#input\_storage\_encrypted) | Enable storage encryption | `bool` | `true` | no |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | Storage type (gp2, gp3, io1) | `string` | `"gp3"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags for the RDS instance | `map(string)` | `{}` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | List of VPC security group IDs | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_instance_address"></a> [db\_instance\_address](#output\_db\_instance\_address) | Address of the RDS instance |
| <a name="output_db_instance_arn"></a> [db\_instance\_arn](#output\_db\_instance\_arn) | ARN of the RDS instance |
| <a name="output_db_instance_endpoint"></a> [db\_instance\_endpoint](#output\_db\_instance\_endpoint) | Connection endpoint for the RDS instance |
| <a name="output_db_instance_id"></a> [db\_instance\_id](#output\_db\_instance\_id) | ID of the RDS instance |
| <a name="output_db_instance_port"></a> [db\_instance\_port](#output\_db\_instance\_port) | Port of the RDS instance |
| <a name="output_db_name"></a> [db\_name](#output\_db\_name) | Name of the database |
| <a name="output_master_password"></a> [master\_password](#output\_master\_password) | Master password for the database |
| <a name="output_master_username"></a> [master\_username](#output\_master\_username) | Master username for the database |
