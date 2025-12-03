output "queue_id" {
  description = "URL of the SQS queue"
  value       = aws_sqs_queue.main.id
}

output "queue_arn" {
  description = "ARN of the SQS queue"
  value       = aws_sqs_queue.main.arn
}

output "queue_name" {
  description = "Name of the SQS queue"
  value       = aws_sqs_queue.main.name
}

output "queue_url" {
  description = "URL of the SQS queue"
  value       = aws_sqs_queue.main.url
}

output "dead_letter_queue_id" {
  description = "URL of the dead letter queue"
  value       = var.enable_dead_letter_queue ? aws_sqs_queue.dead_letter[0].id : null
}

output "dead_letter_queue_arn" {
  description = "ARN of the dead letter queue"
  value       = var.enable_dead_letter_queue ? aws_sqs_queue.dead_letter[0].arn : null
}

output "dead_letter_queue_url" {
  description = "URL of the dead letter queue"
  value       = var.enable_dead_letter_queue ? aws_sqs_queue.dead_letter[0].url : null
}
