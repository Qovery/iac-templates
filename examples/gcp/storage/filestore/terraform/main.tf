terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = join("-", [split("-", var.location)[0], split("-", var.location)[1]])
}

resource "random_id" "filestore_name_suffix" {
  byte_length = 4
}

resource "google_filestore_instance" "main" {
  name        = "${var.instance_name}-${random_id.filestore_name_suffix.hex}"
  location    = var.location
  project     = var.project_id != null ? var.project_id : null
  tier        = var.tier
  description = var.description
  deletion_protection_enabled = var.deletion_protection
  
  labels = merge(
    {
      created_by = "qovery-demo"
    },
    var.labels
  )

  kms_key_name = var.encryption_default_kms_key_name != null ? 1 : 0

  dynamic "file_shares" {
    for_each = var.file_shares
    content {
      name        = file_shares.value.name
      capacity_gb = file_shares.value.capacity_gb
    }
  }

  dynamic "networks" {
    for_each = var.networks
    content {
      network = networks.value.network
      # modes is optional; default to ["MODE_IPV4"] when not provided
      modes             = lookup(networks.value, "modes", ["MODE_IPV4"])
      reserved_ip_range = lookup(networks.value, "reserved_ip_range", null)
    }
  }
}