variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region for the Cloud SQL instance"
  type        = string
  default     = "europe-west1"
}

variable "instance_name" {
  description = "Name of the Cloud SQL instance"
  type        = string
}

variable "database_version" {
  description = "PostgreSQL database version"
  type        = string
  default     = "POSTGRES_16"
}

variable "tier" {
  description = "Machine tier for the instance"
  type        = string
  default     = "db-f1-micro"
}

variable "availability_type" {
  description = "Availability type (ZONAL or REGIONAL)"
  type        = string
  default     = "ZONAL"
}

variable "disk_type" {
  description = "Disk type (PD_SSD or PD_HDD)"
  type        = string
  default     = "PD_SSD"
}

variable "disk_size" {
  description = "Disk size in GB"
  type        = number
  default     = 10
}

variable "disk_autoresize" {
  description = "Enable automatic disk size increase"
  type        = bool
  default     = true
}

variable "backup_enabled" {
  description = "Enable automated backups"
  type        = bool
  default     = true
}

variable "backup_start_time" {
  description = "Start time for backups (HH:MM format)"
  type        = string
  default     = "03:00"
}

variable "point_in_time_recovery_enabled" {
  description = "Enable point-in-time recovery"
  type        = bool
  default     = true
}

variable "transaction_log_retention_days" {
  description = "Number of days to retain transaction logs"
  type        = number
  default     = 7
}

variable "retained_backups" {
  description = "Number of backups to retain"
  type        = number
  default     = 7
}

variable "ipv4_enabled" {
  description = "Enable IPv4 for the instance"
  type        = bool
  default     = true
}

variable "private_network" {
  description = "VPC network for private IP (optional)"
  type        = string
  default     = null
}

variable "ssl_mode" {
  description = "Require SSL for connections"
  type        = string
  default     = "ALLOW_UNENCRYPTED_AND_ENCRYPTED"
}

variable "authorized_networks" {
  description = "List of authorized networks"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "maintenance_window_day" {
  description = "Day of week for maintenance (1-7)"
  type        = number
  default     = 7
}

variable "maintenance_window_hour" {
  description = "Hour of day for maintenance (0-23)"
  type        = number
  default     = 3
}

variable "maintenance_window_update_track" {
  description = "Maintenance update track (stable or canary)"
  type        = string
  default     = "stable"
}

variable "query_insights_enabled" {
  description = "Enable Query Insights"
  type        = bool
  default     = true
}

variable "query_string_length" {
  description = "Maximum query string length for insights"
  type        = number
  default     = 1024
}

variable "record_application_tags" {
  description = "Record application tags in Query Insights"
  type        = bool
  default     = false
}

variable "database_flags" {
  description = "Additional database flags"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "database_name" {
  description = "Name of the database to create"
  type        = string
  default     = "mydb"
}

variable "user_name" {
  description = "Name of the database user"
  type        = string
  default     = "postgres"
}

variable "deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
  default     = false
}
