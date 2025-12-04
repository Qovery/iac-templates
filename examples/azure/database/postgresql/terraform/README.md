## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.0 |
| <a name="provider_random"></a> [random](#provider\_random) | ~> 3.6 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_postgresql_flexible_server.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server) | resource |
| [azurerm_postgresql_flexible_server_configuration.configurations](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_configuration) | resource |
| [azurerm_postgresql_flexible_server_database.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_database) | resource |
| [azurerm_postgresql_flexible_server_firewall_rule.rules](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_firewall_rule) | resource |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [random_password.admin_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_active_directory_auth_enabled"></a> [active\_directory\_auth\_enabled](#input\_active\_directory\_auth\_enabled) | Enable Azure Active Directory authentication | `bool` | `false` | no |
| <a name="input_administrator_login"></a> [administrator\_login](#input\_administrator\_login) | Administrator login for the PostgreSQL server | `string` | `"psqladmin"` | no |
| <a name="input_backup_retention_days"></a> [backup\_retention\_days](#input\_backup\_retention\_days) | Backup retention period in days (7-35) | `number` | `7` | no |
| <a name="input_database_charset"></a> [database\_charset](#input\_database\_charset) | Character set for the database | `string` | `"UTF8"` | no |
| <a name="input_database_collation"></a> [database\_collation](#input\_database\_collation) | Collation for the database | `string` | `"en_US.utf8"` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | Name of the database to create | `string` | `"mydb"` | no |
| <a name="input_firewall_rules"></a> [firewall\_rules](#input\_firewall\_rules) | Map of firewall rules | <pre>map(object({<br>    start_ip = string<br>    end_ip   = string<br>  }))</pre> | `{}` | no |
| <a name="input_geo_redundant_backup_enabled"></a> [geo\_redundant\_backup\_enabled](#input\_geo\_redundant\_backup\_enabled) | Enable geo-redundant backups | `bool` | `false` | no |
| <a name="input_high_availability_mode"></a> [high\_availability\_mode](#input\_high\_availability\_mode) | High availability mode (Disabled, ZoneRedundant, SameZone) | `string` | `"Disabled"` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure region for the PostgreSQL server | `string` | `"West Europe"` | no |
| <a name="input_maintenance_window_day_of_week"></a> [maintenance\_window\_day\_of\_week](#input\_maintenance\_window\_day\_of\_week) | Day of week for maintenance (0-6, 0=Sunday) | `number` | `0` | no |
| <a name="input_maintenance_window_start_hour"></a> [maintenance\_window\_start\_hour](#input\_maintenance\_window\_start\_hour) | Start hour for maintenance window (0-23) | `number` | `3` | no |
| <a name="input_maintenance_window_start_minute"></a> [maintenance\_window\_start\_minute](#input\_maintenance\_window\_start\_minute) | Start minute for maintenance window (0 or 30) | `number` | `0` | no |
| <a name="input_password_auth_enabled"></a> [password\_auth\_enabled](#input\_password\_auth\_enabled) | Enable password authentication | `bool` | `true` | no |
| <a name="input_postgresql_version"></a> [postgresql\_version](#input\_postgresql\_version) | PostgreSQL version (11, 12, 13, 14, 15, 16) | `string` | `"16"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of existing resource group. If not provided, one will be created | `string` | `null` | no |
| <a name="input_server_configurations"></a> [server\_configurations](#input\_server\_configurations) | Map of server configuration parameters | `map(string)` | `{}` | no |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | Name of the PostgreSQL flexible server | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | SKU name (e.g., B\_Standard\_B1ms, GP\_Standard\_D2s\_v3, MO\_Standard\_E4s\_v3) | `string` | `"B_Standard_B1ms"` | no |
| <a name="input_standby_availability_zone"></a> [standby\_availability\_zone](#input\_standby\_availability\_zone) | Standby availability zone for high availability | `string` | `"2"` | no |
| <a name="input_storage_mb"></a> [storage\_mb](#input\_storage\_mb) | Storage size in MB (32768 to 16777216) | `number` | `32768` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags for the PostgreSQL server | `map(string)` | `{}` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Availability zone for the server | `string` | `"1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_administrator_login"></a> [administrator\_login](#output\_administrator\_login) | Administrator login for the PostgreSQL server |
| <a name="output_administrator_password"></a> [administrator\_password](#output\_administrator\_password) | Administrator password for the PostgreSQL server |
| <a name="output_database_id"></a> [database\_id](#output\_database\_id) | ID of the created database |
| <a name="output_database_name"></a> [database\_name](#output\_database\_name) | Name of the created database |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Name of the resource group |
| <a name="output_server_fqdn"></a> [server\_fqdn](#output\_server\_fqdn) | Fully qualified domain name of the PostgreSQL server |
| <a name="output_server_id"></a> [server\_id](#output\_server\_id) | ID of the PostgreSQL flexible server |
| <a name="output_server_name"></a> [server\_name](#output\_server\_name) | Name of the PostgreSQL flexible server |
