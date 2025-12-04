variable "region" {
  description = "AWS region for the ElastiCache cluster"
  type        = string
  default     = "eu-west-3"
}

variable "cluster_id" {
  description = "Identifier for the ElastiCache replication group"
  type        = string
}

variable "description" {
  description = "Description for the ElastiCache replication group"
  type        = string
  default     = "Redis cluster managed by Qovery"
}

variable "engine_version" {
  description = "Redis engine version"
  type        = string
  default     = "7.1"
}

variable "node_type" {
  description = "Instance class for cache nodes"
  type        = string
  default     = "cache.t3.micro"
}

variable "num_cache_clusters" {
  description = "Number of cache clusters (nodes) in the replication group"
  type        = number
  default     = 2
}

variable "parameter_group_name" {
  description = "Name of the parameter group to associate"
  type        = string
  default     = "default.redis7"
}

variable "port" {
  description = "Port number on which the cache accepts connections"
  type        = number
  default     = 6379
}

variable "subnet_ids" {
  description = "List of VPC subnet IDs for the cache subnet group"
  type        = list(string)
  default     = []
}

variable "subnet_group_name" {
  description = "Name of the cache subnet group. If not provided, one will be created"
  type        = string
  default     = null
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
  default     = []
}

variable "automatic_failover_enabled" {
  description = "Enable automatic failover for the replication group"
  type        = bool
  default     = true
}

variable "multi_az_enabled" {
  description = "Enable Multi-AZ support"
  type        = bool
  default     = true
}

variable "at_rest_encryption_enabled" {
  description = "Enable encryption at rest"
  type        = bool
  default     = true
}

variable "transit_encryption_enabled" {
  description = "Enable encryption in transit"
  type        = bool
  default     = true
}

variable "auth_token" {
  description = "AUTH token for Redis (required if transit_encryption_enabled is true)"
  type        = string
  default     = null
  sensitive   = true
}

variable "snapshot_retention_limit" {
  description = "Number of days to retain automatic snapshots"
  type        = number
  default     = 5
}

variable "snapshot_window" {
  description = "Daily time range for automatic snapshots"
  type        = string
  default     = "03:00-05:00"
}

variable "maintenance_window" {
  description = "Weekly time range for maintenance"
  type        = string
  default     = "sun:05:00-sun:07:00"
}

variable "auto_minor_version_upgrade" {
  description = "Enable automatic minor version upgrades"
  type        = bool
  default     = true
}

variable "log_destination" {
  description = "Name of CloudWatch log group for Redis logs"
  type        = string
  default     = null
}

variable "log_destination_type" {
  description = "Destination type for logs (cloudwatch-logs or kinesis-firehose)"
  type        = string
  default     = "cloudwatch-logs"
}

variable "log_format" {
  description = "Log format (json or text)"
  type        = string
  default     = "json"
}

variable "tags" {
  description = "Additional tags for the ElastiCache resources"
  type        = map(string)
  default     = {}
}
