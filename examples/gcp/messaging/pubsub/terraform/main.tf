terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "random_id" "suffix" {
  byte_length = 4
}

# Dead-letter topic
resource "google_pubsub_topic" "dead_letter" {
  name = "${var.topic_prefix}-dl-${random_id.suffix.hex}"
}

# Primary topic
resource "google_pubsub_topic" "main" {
  name = "${var.topic_prefix}-${random_id.suffix.hex}"
}

# Subscription with dead-letter policy
resource "google_pubsub_subscription" "main" {
  name  = "${var.subscription_name}-${random_id.suffix.hex}"
  topic = google_pubsub_topic.main.name

  ack_deadline_seconds        = var.ack_deadline_seconds
  message_retention_duration  = var.message_retention_duration
  project                     = var.project_id
  labels = merge(
    {
      created_by = "qovery-demo"
    },
    var.labels
  )

  dead_letter_policy {
    dead_letter_topic      = google_pubsub_topic.dead_letter.id
    max_delivery_attempts  = var.max_delivery_attempts
  }
}