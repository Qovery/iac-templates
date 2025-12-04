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

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "google_storage_bucket" "main" {
  name          = "${var.bucket_name}-${random_id.bucket_suffix.hex}"
  location      = var.location
  storage_class = var.storage_class

  uniform_bucket_level_access = var.uniform_bucket_level_access
  force_destroy               = var.force_destroy

  versioning {
    enabled = var.versioning_enabled
  }

  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rules
    content {
      action {
        type          = lifecycle_rule.value.action.type
        storage_class = lookup(lifecycle_rule.value.action, "storage_class", null)
      }
      condition {
        age                   = lookup(lifecycle_rule.value.condition, "age", null)
        created_before        = lookup(lifecycle_rule.value.condition, "created_before", null)
        with_state            = lookup(lifecycle_rule.value.condition, "with_state", null)
        matches_storage_class = lookup(lifecycle_rule.value.condition, "matches_storage_class", null)
        num_newer_versions    = lookup(lifecycle_rule.value.condition, "num_newer_versions", null)
      }
    }
  }

  dynamic "cors" {
    for_each = var.cors_rules
    content {
      origin          = cors.value.origin
      method          = cors.value.method
      response_header = cors.value.response_header
      max_age_seconds = cors.value.max_age_seconds
    }
  }

  dynamic "encryption" {
    for_each = var.encryption_default_kms_key_name != null ? [1] : []
    content {
      default_kms_key_name = var.encryption_default_kms_key_name
    }
  }

  labels = merge(
    {
      created_by = "qovery-demo"
    },
    var.labels
  )
}

resource "google_storage_bucket_iam_member" "members" {
  for_each = var.iam_members

  bucket = google_storage_bucket.main.name
  role   = each.value.role
  member = each.value.member
}
