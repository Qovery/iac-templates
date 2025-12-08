## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 7.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 7.0 |
| <a name="provider_random"></a> [random](#provider\_random) | ~> 3.6 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_sql_database.database](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database) | resource |
| [google_sql_database_instance.postgresql](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance) | resource |
| [google_sql_user.user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |
| [random_id.db_name_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [random_password.db_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_authorized_networks"></a> [authorized\_networks](#input\_authorized\_networks) | List of authorized networks | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_availability_type"></a> [availability\_type](#input\_availability\_type) | Availability type (ZONAL or REGIONAL) | `string` | `"ZONAL"` | no |
| <a name="input_backup_enabled"></a> [backup\_enabled](#input\_backup\_enabled) | Enable automated backups | `bool` | `true` | no |
| <a name="input_backup_start_time"></a> [backup\_start\_time](#input\_backup\_start\_time) | Start time for backups (HH:MM format) | `string` | `"03:00"` | no |
| <a name="input_database_flags"></a> [database\_flags](#input\_database\_flags) | Additional database flags | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | Name of the database to create | `string` | `"mydb"` | no |
| <a name="input_database_version"></a> [database\_version](#input\_database\_version) | PostgreSQL database version | `string` | `"POSTGRES_16"` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Enable deletion protection | `bool` | `false` | no |
| <a name="input_disk_autoresize"></a> [disk\_autoresize](#input\_disk\_autoresize) | Enable automatic disk size increase | `bool` | `true` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | Disk size in GB | `number` | `10` | no |
| <a name="input_disk_type"></a> [disk\_type](#input\_disk\_type) | Disk type (PD\_SSD or PD\_HDD) | `string` | `"PD_SSD"` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Name of the Cloud SQL instance | `string` | n/a | yes |
| <a name="input_ipv4_enabled"></a> [ipv4\_enabled](#input\_ipv4\_enabled) | Enable IPv4 for the instance | `bool` | `true` | no |
| <a name="input_maintenance_window_day"></a> [maintenance\_window\_day](#input\_maintenance\_window\_day) | Day of week for maintenance (1-7) | `number` | `7` | no |
| <a name="input_maintenance_window_hour"></a> [maintenance\_window\_hour](#input\_maintenance\_window\_hour) | Hour of day for maintenance (0-23) | `number` | `3` | no |
| <a name="input_maintenance_window_update_track"></a> [maintenance\_window\_update\_track](#input\_maintenance\_window\_update\_track) | Maintenance update track (stable or canary) | `string` | `"stable"` | no |
| <a name="input_point_in_time_recovery_enabled"></a> [point\_in\_time\_recovery\_enabled](#input\_point\_in\_time\_recovery\_enabled) | Enable point-in-time recovery | `bool` | `true` | no |
| <a name="input_private_network"></a> [private\_network](#input\_private\_network) | VPC network for private IP (optional) | `string` | `null` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | GCP project ID | `string` | n/a | yes |
| <a name="input_query_insights_enabled"></a> [query\_insights\_enabled](#input\_query\_insights\_enabled) | Enable Query Insights | `bool` | `true` | no |
| <a name="input_query_string_length"></a> [query\_string\_length](#input\_query\_string\_length) | Maximum query string length for insights | `number` | `1024` | no |
| <a name="input_record_application_tags"></a> [record\_application\_tags](#input\_record\_application\_tags) | Record application tags in Query Insights | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | GCP region for the Cloud SQL instance | `string` | `"europe-west1"` | no |
| <a name="input_require_ssl"></a> [require\_ssl](#input\_require\_ssl) | Require SSL for connections | `bool` | `false` | no |
| <a name="input_retained_backups"></a> [retained\_backups](#input\_retained\_backups) | Number of backups to retain | `number` | `7` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | Machine tier for the instance | `string` | `"db-f1-micro"` | no |
| <a name="input_transaction_log_retention_days"></a> [transaction\_log\_retention\_days](#input\_transaction\_log\_retention\_days) | Number of days to retain transaction logs | `number` | `7` | no |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | Name of the database user | `string` | `"postgres"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_database_name"></a> [database\_name](#output\_database\_name) | Name of the database |
| <a name="output_instance_connection_name"></a> [instance\_connection\_name](#output\_instance\_connection\_name) | Connection name of the instance |
| <a name="output_instance_ip_address"></a> [instance\_ip\_address](#output\_instance\_ip\_address) | First public IP address of the instance |
| <a name="output_instance_name"></a> [instance\_name](#output\_instance\_name) | Name of the Cloud SQL instance |
| <a name="output_instance_self_link"></a> [instance\_self\_link](#output\_instance\_self\_link) | Self link of the Cloud SQL instance |
| <a name="output_private_ip_address"></a> [private\_ip\_address](#output\_private\_ip\_address) | First private IP address of the instance |
| <a name="output_user_name"></a> [user\_name](#output\_user\_name) | Database user name |
| <a name="output_user_password"></a> [user\_password](#output\_user\_password) | Database user password |
