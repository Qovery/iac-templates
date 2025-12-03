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

resource "random_password" "admin_password" {
  length  = 32
  special = true
}

resource "azurerm_resource_group" "main" {
  count    = var.resource_group_name == null ? 1 : 0
  name     = "${var.server_name}-rg"
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

resource "azurerm_mysql_flexible_server" "main" {
  name                = var.server_name
  resource_group_name = local.resource_group_name
  location            = var.location

  version                = var.mysql_version
  administrator_login    = var.administrator_login
  administrator_password = random_password.admin_password.result
  zone                   = var.zone
  storage {
    size_gb           = var.storage_gb
    auto_grow_enabled = var.storage_auto_grow_enabled
  }
  sku_name                     = var.sku_name
  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled

  high_availability {
    mode                      = var.high_availability_mode
    standby_availability_zone = var.high_availability_mode != "Disabled" ? var.standby_availability_zone : null
  }

  maintenance_window {
    day_of_week  = var.maintenance_window_day_of_week
    start_hour   = var.maintenance_window_start_hour
    start_minute = var.maintenance_window_start_minute
  }

  tags = merge(
    {
      Name      = var.server_name
      CreatedBy = "QoveryDemo"
    },
    var.tags
  )
}

resource "azurerm_mysql_flexible_database" "main" {
  name                = var.database_name
  resource_group_name = local.resource_group_name
  server_name         = azurerm_mysql_flexible_server.main.name
  charset             = var.database_charset
  collation           = var.database_collation
}

resource "azurerm_mysql_flexible_server_firewall_rule" "rules" {
  for_each = var.firewall_rules

  name                = each.key
  resource_group_name = local.resource_group_name
  server_name         = azurerm_mysql_flexible_server.main.name
  start_ip_address    = each.value.start_ip
  end_ip_address      = each.value.end_ip
}

resource "azurerm_mysql_flexible_server_configuration" "configurations" {
  for_each = var.server_configurations

  name                = each.key
  resource_group_name = local.resource_group_name
  server_name         = azurerm_mysql_flexible_server.main.name
  value               = each.value
}
