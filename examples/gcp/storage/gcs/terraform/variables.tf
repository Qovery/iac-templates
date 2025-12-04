variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "europe-west1"
}

variable "bucket_name" {
  description = "Base name of the Cloud Storage bucket"
  type        = string
}

variable "location" {
  description = "Bucket location (region or multi-region)"
  type        = string
  default     = "EU"
}

variable "storage_class" {
  description = "Storage class (STANDARD, NEARLINE, COLDLINE, ARCHIVE)"
  type        = string
  default     = "STANDARD"
}

variable "uniform_bucket_level_access" {
  description = "Enable uniform bucket-level access"
  type        = bool
  default     = true
}

variable "force_destroy" {
  description = "Allow bucket deletion even when not empty"
  type        = bool
  default     = false
}

variable "versioning_enabled" {
  description = "Enable object versioning"
  type        = bool
  default     = false
}

variable "lifecycle_rules" {
  description = "List of lifecycle rules"
  type = list(object({
    action = object({
      type          = string
      storage_class = optional(string)
    })
    condition = object({
      age                   = optional(number)
      created_before        = optional(string)
      with_state            = optional(string)
      matches_storage_class = optional(list(string))
      num_newer_versions    = optional(number)
    })
  }))
  default = []
}

variable "cors_rules" {
  description = "CORS configuration"
  type = list(object({
    origin          = list(string)
    method          = list(string)
    response_header = list(string)
    max_age_seconds = number
  }))
  default = []
}

variable "encryption_default_kms_key_name" {
  description = "KMS key name for default encryption (optional)"
  type        = string
  default     = null
}

variable "iam_members" {
  description = "IAM members to grant access to the bucket"
  type = map(object({
    role   = string
    member = string
  }))
  default = {}
}

variable "labels" {
  description = "Additional labels for the bucket"
  type        = map(string)
  default     = {}
}
