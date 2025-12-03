variable "region" {
  description = "AWS region for the SQS queue"
  type        = string
  default     = "eu-west-3"
}

variable "queue_name" {
  description = "Name of the SQS queue"
  type        = string
}

variable "fifo_queue" {
  description = "Boolean designating a FIFO queue"
  type        = bool
  default     = false
}

variable "content_based_deduplication" {
  description = "Enable content-based deduplication for FIFO queues"
  type        = bool
  default     = false
}

variable "delay_seconds" {
  description = "Delay in seconds for message delivery"
  type        = number
  default     = 0
}

variable "max_message_size" {
  description = "Maximum message size in bytes"
  type        = number
  default     = 262144
}

variable "message_retention_seconds" {
  description = "Number of seconds to retain messages"
  type        = number
  default     = 345600
}

variable "receive_wait_time_seconds" {
  description = "Time for which ReceiveMessage waits for a message"
  type        = number
  default     = 0
}

variable "visibility_timeout_seconds" {
  description = "Visibility timeout for the queue"
  type        = number
  default     = 30
}

variable "sqs_managed_sse_enabled" {
  description = "Enable SQS managed server-side encryption"
  type        = bool
  default     = true
}

variable "kms_master_key_id" {
  description = "ID of AWS KMS key for encryption (optional)"
  type        = string
  default     = null
}

variable "kms_data_key_reuse_period_seconds" {
  description = "Length of time KMS data key is reused"
  type        = number
  default     = 300
}

variable "enable_dead_letter_queue" {
  description = "Enable dead letter queue for failed messages"
  type        = bool
  default     = true
}

variable "max_receive_count" {
  description = "Maximum receives before sending to DLQ"
  type        = number
  default     = 3
}

variable "dlq_message_retention_seconds" {
  description = "Message retention period for dead letter queue"
  type        = number
  default     = 1209600
}

variable "queue_policy" {
  description = "JSON policy for the queue (optional)"
  type        = string
  default     = null
}

variable "tags" {
  description = "Additional tags for the SQS queue"
  type        = map(string)
  default     = {}
}
