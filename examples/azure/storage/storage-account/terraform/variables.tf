variable "location" {
  description = "Azure region for the storage account"
  type        = string
  default     = "West Europe"
}

variable "storage_account_prefix" {
  description = "Prefix for the storage account name (3-24 lowercase letters and numbers)"
  type        = string
}

variable "resource_group_name" {
  description = "Name of existing resource group. If not provided, one will be created"
  type        = string
  default     = null
}

variable "account_tier" {
  description = "Performance tier (Standard or Premium)"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Replication type (LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS)"
  type        = string
  default     = "LRS"
}

variable "account_kind" {
  description = "Account kind (BlobStorage, BlockBlobStorage, FileStorage, Storage, StorageV2)"
  type        = string
  default     = "StorageV2"
}

variable "min_tls_version" {
  description = "Minimum TLS version"
  type        = string
  default     = "TLS1_2"
}

variable "enable_https_traffic_only" {
  description = "Force HTTPS traffic only"
  type        = bool
  default     = true
}

variable "allow_nested_items_to_be_public" {
  description = "Allow nested items to be public"
  type        = bool
  default     = false
}

variable "versioning_enabled" {
  description = "Enable blob versioning"
  type        = bool
  default     = false
}

variable "blob_delete_retention_days" {
  description = "Number of days to retain deleted blobs (0 to disable)"
  type        = number
  default     = 7
}

variable "container_delete_retention_days" {
  description = "Number of days to retain deleted containers (0 to disable)"
  type        = number
  default     = 7
}

variable "cors_rules" {
  description = "CORS rules for blob storage"
  type = list(object({
    allowed_headers    = list(string)
    allowed_methods    = list(string)
    allowed_origins    = list(string)
    exposed_headers    = list(string)
    max_age_in_seconds = number
  }))
  default = []
}

variable "network_rules_default_action" {
  description = "Default action for network rules (Allow or Deny)"
  type        = string
  default     = "Allow"
}

variable "network_rules_ip_rules" {
  description = "List of IP addresses or CIDR blocks with access"
  type        = list(string)
  default     = []
}

variable "network_rules_subnet_ids" {
  description = "List of subnet IDs with access"
  type        = list(string)
  default     = []
}

variable "network_rules_bypass" {
  description = "Network rule bypass for Azure services"
  type        = list(string)
  default     = ["AzureServices"]
}

variable "containers" {
  description = "Map of container names to their configuration"
  type = map(object({
    access_type = string
  }))
  default = {}
}

variable "tags" {
  description = "Additional tags for the storage account"
  type        = map(string)
  default     = {}
}
