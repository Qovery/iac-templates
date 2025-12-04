variable "region" {
  description = "AWS region for the DocumentDB cluster"
  type        = string
  default     = "eu-west-3"
}

variable "cluster_identifier" {
  description = "Identifier for the DocumentDB cluster"
  type        = string
}

variable "engine_version" {
  description = "DocumentDB engine version"
  type        = string
  default     = "5.0.0"
}

variable "instance_class" {
  description = "Instance class for DocumentDB instances"
  type        = string
  default     = "db.t3.medium"
}

variable "instance_count" {
  description = "Number of instances in the cluster"
  type        = number
  default     = 1
}

variable "master_username" {
  description = "Master username for the cluster"
  type        = string
  default     = "docdbadmin"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the DB subnet group"
  type        = list(string)
  default     = []
}

variable "subnet_group_name" {
  description = "Name of DB subnet group. If not provided, one will be created"
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs"
  type        = list(string)
  default     = []
}

variable "backup_retention_period" {
  description = "Backup retention period in days"
  type        = number
  default     = 7
}

variable "preferred_backup_window" {
  description = "Daily time range for backups"
  type        = string
  default     = "03:00-05:00"
}

variable "preferred_maintenance_window" {
  description = "Weekly time range for maintenance"
  type        = string
  default     = "sun:05:00-sun:07:00"
}

variable "storage_encrypted" {
  description = "Enable storage encryption"
  type        = bool
  default     = true
}

variable "kms_key_id" {
  description = "ARN of KMS key for encryption (optional)"
  type        = string
  default     = null
}

variable "enabled_cloudwatch_logs_exports" {
  description = "List of log types to export to CloudWatch"
  type        = list(string)
  default     = ["audit", "profiler"]
}

variable "deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot when destroying"
  type        = bool
  default     = true
}

variable "db_cluster_parameter_group_name" {
  description = "Name of the DB cluster parameter group"
  type        = string
  default     = null
}

variable "auto_minor_version_upgrade" {
  description = "Enable automatic minor version upgrades"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional tags for DocumentDB resources"
  type        = map(string)
  default     = {}
}
