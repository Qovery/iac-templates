variable "location" {
  description = "Azure region for the PostgreSQL server"
  type        = string
  default     = "West Europe"
}

variable "server_name" {
  description = "Name of the PostgreSQL flexible server"
  type        = string
}

variable "resource_group_name" {
  description = "Name of existing resource group. If not provided, one will be created"
  type        = string
  default     = null
}

variable "postgresql_version" {
  description = "PostgreSQL version (11, 12, 13, 14, 15, 16)"
  type        = string
  default     = "16"
}

variable "administrator_login" {
  description = "Administrator login for the PostgreSQL server"
  type        = string
  default     = "psqladmin"
}

variable "zone" {
  description = "Availability zone for the server"
  type        = string
  default     = "1"
}

variable "storage_mb" {
  description = "Storage size in MB (32768 to 16777216)"
  type        = number
  default     = 32768
}

variable "sku_name" {
  description = "SKU name (e.g., B_Standard_B1ms, GP_Standard_D2s_v3, MO_Standard_E4s_v3)"
  type        = string
  default     = "B_Standard_B1ms"
}

variable "backup_retention_days" {
  description = "Backup retention period in days (7-35)"
  type        = number
  default     = 7
}

variable "geo_redundant_backup_enabled" {
  description = "Enable geo-redundant backups"
  type        = bool
  default     = false
}

variable "active_directory_auth_enabled" {
  description = "Enable Azure Active Directory authentication"
  type        = bool
  default     = false
}

variable "password_auth_enabled" {
  description = "Enable password authentication"
  type        = bool
  default     = true
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
  default     = "en_US.utf8"
}

variable "database_charset" {
  description = "Character set for the database"
  type        = string
  default     = "UTF8"
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
  description = "Additional tags for the PostgreSQL server"
  type        = map(string)
  default     = {}
}
