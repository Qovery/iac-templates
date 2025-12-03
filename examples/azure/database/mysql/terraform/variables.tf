variable "location" {
  description = "Azure region for the MySQL server"
  type        = string
  default     = "West Europe"
}

variable "server_name" {
  description = "Name of the MySQL flexible server"
  type        = string
}

variable "resource_group_name" {
  description = "Name of existing resource group. If not provided, one will be created"
  type        = string
  default     = null
}

variable "mysql_version" {
  description = "MySQL version (5.7 or 8.0.21)"
  type        = string
  default     = "8.0.21"
}

variable "administrator_login" {
  description = "Administrator login for the MySQL server"
  type        = string
  default     = "mysqladmin"
}

variable "zone" {
  description = "Availability zone for the server"
  type        = string
  default     = "1"
}

variable "storage_gb" {
  description = "Storage size in GB (20 to 16384)"
  type        = number
  default     = 20
}

variable "storage_auto_grow_enabled" {
  description = "Enable storage auto-grow"
  type        = bool
  default     = true
}

variable "sku_name" {
  description = "SKU name (e.g., B_Standard_B1s, GP_Standard_D2ds_v4, MO_Standard_E4ds_v4)"
  type        = string
  default     = "B_Standard_B1s"
}

variable "backup_retention_days" {
  description = "Backup retention period in days (1-35)"
  type        = number
  default     = 7
}

variable "geo_redundant_backup_enabled" {
  description = "Enable geo-redundant backups"
  type        = bool
  default     = false
}

variable "high_availability_mode" {
  description = "High availability mode (Disabled, ZoneRedundant, SameZone)"
  type        = string
  default     = "Disabled"
}

variable "standby_availability_zone" {
  description = "Standby availability zone for high availability"
  type        = string
  default     = "2"
}

variable "maintenance_window_day_of_week" {
  description = "Day of week for maintenance (0-6, 0=Sunday)"
  type        = number
  default     = 0
}

variable "maintenance_window_start_hour" {
  description = "Start hour for maintenance window (0-23)"
  type        = number
  default     = 3
}

variable "maintenance_window_start_minute" {
  description = "Start minute for maintenance window (0 or 30)"
  type        = number
  default     = 0
}

variable "database_name" {
  description = "Name of the database to create"
  type        = string
  default     = "mydb"
}

variable "database_collation" {
  description = "Collation for the database"
  type        = string
  default     = "utf8_general_ci"
}

variable "database_charset" {
  description = "Character set for the database"
  type        = string
  default     = "utf8"
}

variable "firewall_rules" {
  description = "Map of firewall rules"
  type = map(object({
    start_ip = string
    end_ip   = string
  }))
  default = {}
}

variable "server_configurations" {
  description = "Map of server configuration parameters"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Additional tags for the MySQL server"
  type        = map(string)
  default     = {}
}
