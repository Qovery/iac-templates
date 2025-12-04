variable "project_id" {
  description = "GCP project ID"
  type        = string
  default     = null
}

variable "location" {
  description = "GCP zone or region (for ENTERPRISE tier) for the Filestore instance"
  type        = string
  default     = "europe-west1-b"
}

variable "instance_name" {
  description = "Name of the Filestore instance"
  type        = string
}

variable "tier" {
  description = "Filestore tier (e.g. STANDARD, PREMIUM, BASIC_HDD, BASIC_SSD)"
  type        = string
  default     = "STANDARD"
}

variable "file_shares" {
  description = "List of file shares to create. Each object must contain name and capacity_gb."
  type = list(object({
    name       = string
    capacity_gb = number
  }))
  default = [
    {
      name       = "vol1"
      capacity_gb = 1024
    }
  ]
}

variable "networks" {
  description = "List of network configurations for the instance. Each object may contain network, modes, reserved_ip_range."
  type = list(object({
    network           = string
    modes             = optional(list(string), ["MODE_IPV4"])
    reserved_ip_range = optional(string)
  }))
  default = []
}

variable "labels" {
  description = "Labels to apply to the Filestore instance"
  type        = map(string)
  default     = {}
}

variable "description" {
  description = "Description for the Filestore instance"
  type        = string
  default     = null
}

variable "deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
  default     = false
}

variable "encryption_default_kms_key_name" {
  description = "KMS key name for default encryption (optional)"
  type        = string
  default     = null
}