output "topic_name" {
  description = "Name of the primary Pub/Sub topic"
  value       = google_pubsub_topic.main.name
}

output "dead_letter_topic_name" {
  description = "Name of the dead-letter Pub/Sub topic"
  value       = google_pubsub_topic.dead_letter.name
}

output "subscription_name" {
  description = "Name of the created subscription"
  value       = google_pubsub_subscription.main.name
}

output "subscription_id" {
  description = "ID of the created subscription"
  value       = google_pubsub_subscription.main.id
}