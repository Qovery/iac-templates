variable "bucket_prefix" {
  description = "Prefix for the S3 bucket name"
  type        = string
}

variable "region" {
  description = "AWS region for the S3 bucket"
  type        = string
  default     = "eu-west-3"
}
