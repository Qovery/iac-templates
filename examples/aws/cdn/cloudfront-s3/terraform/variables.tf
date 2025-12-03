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

# CloudFront Configuration
variable "comment" {
  description = "Comment for the CloudFront distribution"
  type        = string
  default     = "CloudFront distribution for S3 bucket"
}

variable "default_root_object" {
  description = "Object that CloudFront returns when the root URL is requested"
  type        = string
  default     = "index.html"
}

variable "ipv6_enabled" {
  description = "Enable IPv6 for CloudFront distribution"
  type        = bool
  default     = true
}

variable "price_class" {
  description = "Price class for CloudFront distribution (PriceClass_All, PriceClass_200, PriceClass_100)"
  type        = string
  default     = "PriceClass_100"
}

variable "aliases" {
  description = "Alternate domain names (CNAMEs) for the distribution"
  type        = list(string)
  default     = []
}

variable "acm_certificate_arn" {
  description = "ARN of ACM certificate for custom domain (must be in us-east-1)"
  type        = string
  default     = null
}

variable "minimum_protocol_version" {
  description = "Minimum TLS protocol version"
  type        = string
  default     = "TLSv1.2_2021"
}

# Cache Behavior
variable "default_cache_allowed_methods" {
  description = "HTTP methods that CloudFront processes and forwards"
  type        = list(string)
  default     = ["GET", "HEAD", "OPTIONS"]
}

variable "default_cache_cached_methods" {
  description = "HTTP methods for which CloudFront caches responses"
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "viewer_protocol_policy" {
  description = "Protocol policy (allow-all, https-only, redirect-to-https)"
  type        = string
  default     = "redirect-to-https"
}

variable "min_ttl" {
  description = "Minimum TTL in seconds"
  type        = number
  default     = 0
}

variable "default_ttl" {
  description = "Default TTL in seconds"
  type        = number
  default     = 3600
}

variable "max_ttl" {
  description = "Maximum TTL in seconds"
  type        = number
  default     = 86400
}

variable "compress" {
  description = "Enable automatic compression"
  type        = bool
  default     = true
}

variable "forward_query_string" {
  description = "Forward query strings to the origin"
  type        = bool
  default     = false
}

variable "forward_headers" {
  description = "Headers to forward to the origin"
  type        = list(string)
  default     = []
}

variable "forward_cookies" {
  description = "Cookie forwarding policy (none, whitelist, all)"
  type        = string
  default     = "none"
}

variable "cloudfront_functions" {
  description = "CloudFront Functions to associate with the distribution"
  type = list(object({
    event_type   = string
    function_arn = string
  }))
  default = []
}

variable "ordered_cache_behaviors" {
  description = "Ordered list of cache behaviors"
  type = list(object({
    path_pattern           = string
    allowed_methods        = list(string)
    cached_methods         = list(string)
    viewer_protocol_policy = string
    min_ttl                = number
    default_ttl            = number
    max_ttl                = number
    compress               = bool
    forward_query_string   = bool
    forward_headers        = list(string)
    forward_cookies        = string
  }))
  default = []
}

variable "custom_error_responses" {
  description = "Custom error responses"
  type = list(object({
    error_code            = number
    response_code         = number
    response_page_path    = string
    error_caching_min_ttl = number
  }))
  default = [
    {
      error_code            = 404
      response_code         = 404
      response_page_path    = "/404.html"
      error_caching_min_ttl = 300
    },
    {
      error_code            = 403
      response_code         = 403
      response_page_path    = "/403.html"
      error_caching_min_ttl = 300
    }
  ]
}

variable "geo_restriction_type" {
  description = "Geo restriction type (none, whitelist, blacklist)"
  type        = string
  default     = "none"
}

variable "geo_restriction_locations" {
  description = "List of country codes for geo restriction"
  type        = list(string)
  default     = []
}

variable "logging_bucket" {
  description = "S3 bucket for CloudFront access logs (must end with .s3.amazonaws.com)"
  type        = string
  default     = ""
}

variable "logging_prefix" {
  description = "Prefix for CloudFront log files"
  type        = string
  default     = "cloudfront/"
}

variable "logging_include_cookies" {
  description = "Include cookies in access logs"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
