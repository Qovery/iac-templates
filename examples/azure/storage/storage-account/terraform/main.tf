terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "random_id" "storage_account_suffix" {
  byte_length = 4
}

resource "azurerm_resource_group" "main" {
  count    = var.resource_group_name == null ? 1 : 0
  name     = "${var.storage_account_prefix}-rg"
  location = var.location

  tags = merge(
    {
      CreatedBy = "QoveryDemo"
    },
    var.tags
  )
}

locals {
  resource_group_name = var.resource_group_name != null ? var.resource_group_name : azurerm_resource_group.main[0].name
}

resource "azurerm_storage_account" "main" {
  name                     = lower("${var.storage_account_prefix}${random_id.storage_account_suffix.hex}")
  resource_group_name      = local.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = var.account_kind

  min_tls_version                 = var.min_tls_version
  enable_https_traffic_only       = var.enable_https_traffic_only
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public

  blob_properties {
    versioning_enabled = var.versioning_enabled

    dynamic "delete_retention_policy" {
      for_each = var.blob_delete_retention_days > 0 ? [1] : []
      content {
        days = var.blob_delete_retention_days
      }
    }

    dynamic "container_delete_retention_policy" {
      for_each = var.container_delete_retention_days > 0 ? [1] : []
      content {
        days = var.container_delete_retention_days
      }
    }

    dynamic "cors_rule" {
      for_each = var.cors_rules
      content {
        allowed_headers    = cors_rule.value.allowed_headers
        allowed_methods    = cors_rule.value.allowed_methods
        allowed_origins    = cors_rule.value.allowed_origins
        exposed_headers    = cors_rule.value.exposed_headers
        max_age_in_seconds = cors_rule.value.max_age_in_seconds
      }
    }
  }

  network_rules {
    default_action             = var.network_rules_default_action
    ip_rules                   = var.network_rules_ip_rules
    virtual_network_subnet_ids = var.network_rules_subnet_ids
    bypass                     = var.network_rules_bypass
  }

  tags = merge(
    {
      Name      = "${var.storage_account_prefix}${random_id.storage_account_suffix.hex}"
      CreatedBy = "QoveryDemo"
    },
    var.tags
  )
}

resource "azurerm_storage_container" "containers" {
  for_each = var.containers

  name                  = each.key
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = each.value.access_type
}
