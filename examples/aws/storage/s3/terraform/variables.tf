variable "region" {
  description = "AWS region for the S3 bucket"
  type        = string
  default     = "eu-west-3"
}

variable "bucket_prefix" {
  description = "Prefix for the S3 bucket name"
  type        = string
}

variable "force_destroy" {
  description = "Allow bucket deletion even when not empty"
  type        = bool
  default     = false
}

variable "versioning_enabled" {
  description = "Enable versioning for the S3 bucket"
  type        = bool
  default     = false
}

variable "sse_algorithm" {
  description = "Server-side encryption algorithm (AES256 or aws:kms)"
  type        = string
  default     = "AES256"
}

variable "kms_master_key_id" {
  description = "KMS key ID for encryption (required if sse_algorithm is aws:kms)"
  type        = string
  default     = null
}

variable "bucket_key_enabled" {
  description = "Enable S3 Bucket Key for SSE-KMS"
  type        = bool
  default     = true
}

variable "block_public_acls" {
  description = "Block public ACLs"
  type        = bool
  default     = true
}

variable "block_public_policy" {
  description = "Block public bucket policies"
  type        = bool
  default     = true
}

variable "ignore_public_acls" {
  description = "Ignore public ACLs"
  type        = bool
  default     = true
}

variable "restrict_public_buckets" {
  description = "Restrict public bucket policies"
  type        = bool
  default     = true
}

variable "object_ownership" {
  description = "Object ownership (BucketOwnerPreferred, ObjectWriter, or BucketOwnerEnforced)"
  type        = string
  default     = "BucketOwnerEnforced"
}

variable "lifecycle_rules" {
  description = "List of lifecycle rules"
  type = list(object({
    id                                 = string
    enabled                            = bool
    prefix                             = optional(string)
    tags                               = optional(map(string), {})
    expiration_days                    = optional(number)
    noncurrent_version_expiration_days = optional(number)
    transitions = optional(list(object({
      days          = number
      storage_class = string
    })), [])
    noncurrent_version_transitions = optional(list(object({
      days          = number
      storage_class = string
    })), [])
  }))
  default = []
}

variable "cors_rules" {
  description = "List of CORS rules"
  type = list(object({
    allowed_headers = list(string)
    allowed_methods = list(string)
    allowed_origins = list(string)
    expose_headers  = optional(list(string), [])
    max_age_seconds = optional(number, 3000)
  }))
  default = []
}

variable "logging_bucket" {
  description = "Target bucket for access logs"
  type        = string
  default     = null
}

variable "logging_prefix" {
  description = "Prefix for access log objects"
  type        = string
  default     = "log/"
}

variable "intelligent_tiering_enabled" {
  description = "Enable S3 Intelligent-Tiering"
  type        = bool
  default     = false
}

variable "intelligent_tiering_archive_days" {
  description = "Days before moving to Archive Access tier"
  type        = number
  default     = 90
}

variable "intelligent_tiering_deep_archive_days" {
  description = "Days before moving to Deep Archive Access tier"
  type        = number
  default     = 180
}

variable "tags" {
  description = "Additional tags for the S3 bucket"
  type        = map(string)
  default     = {}
}
