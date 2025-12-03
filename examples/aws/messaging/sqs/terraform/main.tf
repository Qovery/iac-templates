terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_sqs_queue" "main" {
  name                        = var.queue_name
  fifo_queue                  = var.fifo_queue
  content_based_deduplication = var.fifo_queue ? var.content_based_deduplication : null

  delay_seconds              = var.delay_seconds
  max_message_size           = var.max_message_size
  message_retention_seconds  = var.message_retention_seconds
  receive_wait_time_seconds  = var.receive_wait_time_seconds
  visibility_timeout_seconds = var.visibility_timeout_seconds

  sqs_managed_sse_enabled           = var.sqs_managed_sse_enabled
  kms_master_key_id                 = var.kms_master_key_id
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds

  redrive_policy = var.enable_dead_letter_queue ? jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dead_letter[0].arn
    maxReceiveCount     = var.max_receive_count
  }) : null

  tags = merge(
    {
      Name      = var.queue_name
      CreatedBy = "QoveryDemo"
    },
    var.tags
  )
}

resource "aws_sqs_queue" "dead_letter" {
  count = var.enable_dead_letter_queue ? 1 : 0

  name                      = "${var.queue_name}-dlq"
  fifo_queue                = var.fifo_queue
  message_retention_seconds = var.dlq_message_retention_seconds

  sqs_managed_sse_enabled           = var.sqs_managed_sse_enabled
  kms_master_key_id                 = var.kms_master_key_id
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds

  tags = merge(
    {
      Name      = "${var.queue_name}-dlq"
      CreatedBy = "QoveryDemo"
    },
    var.tags
  )
}

resource "aws_sqs_queue_policy" "main" {
  count     = var.queue_policy != null ? 1 : 0
  queue_url = aws_sqs_queue.main.id
  policy    = var.queue_policy
}
