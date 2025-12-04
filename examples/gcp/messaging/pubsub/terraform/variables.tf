variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "europe-west1"
}

variable "topic_prefix" {
  description = "Prefix used to name the Pub/Sub topics"
  type        = string
  default     = "demo-topic"
}

variable "subscription_name" {
  description = "Base name for the subscription"
  type        = string
  default     = "demo-subscription"
}

variable "ack_deadline_seconds" {
  description = "Ack deadline in seconds for the subscription"
  type        = number
  default     = 10
}

variable "message_retention_duration" {
  description = "Retention duration for messages (e.g., \"600s\")"
  type        = string
  default     = "600s"
}

variable "max_delivery_attempts" {
  description = "Maximum delivery attempts before message is sent to the dead-letter topic"
  type        = number
  default     = 5
}

variable "labels" {
  description = "Labels to attach to the subscription"
  type        = map(string)
  default     = {}
}