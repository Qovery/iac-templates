output "server_id" {
  description = "ID of the PostgreSQL flexible server"
  value       = azurerm_postgresql_flexible_server.main.id
}

output "server_name" {
  description = "Name of the PostgreSQL flexible server"
  value       = azurerm_postgresql_flexible_server.main.name
}

output "server_fqdn" {
  description = "Fully qualified domain name of the PostgreSQL server"
  value       = azurerm_postgresql_flexible_server.main.fqdn
}

output "administrator_login" {
  description = "Administrator login for the PostgreSQL server"
  value       = azurerm_postgresql_flexible_server.main.administrator_login
  sensitive   = true
}

output "administrator_password" {
  description = "Administrator password for the PostgreSQL server"
  value       = random_password.admin_password.result
  sensitive   = true
}

output "database_name" {
  description = "Name of the created database"
  value       = azurerm_postgresql_flexible_server_database.main.name
}

output "database_id" {
  description = "ID of the created database"
  value       = azurerm_postgresql_flexible_server_database.main.id
}

output "resource_group_name" {
  description = "Name of the resource group"
  value       = local.resource_group_name
}
