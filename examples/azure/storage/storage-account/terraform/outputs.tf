output "storage_account_id" {
  description = "ID of the storage account"
  value       = azurerm_storage_account.main.id
}

output "storage_account_name" {
  description = "Name of the storage account"
  value       = azurerm_storage_account.main.name
}

output "primary_blob_endpoint" {
  description = "Primary blob storage endpoint"
  value       = azurerm_storage_account.main.primary_blob_endpoint
}

output "primary_blob_host" {
  description = "Primary blob storage host"
  value       = azurerm_storage_account.main.primary_blob_host
}

output "primary_access_key" {
  description = "Primary access key for the storage account"
  value       = azurerm_storage_account.main.primary_access_key
  sensitive   = true
}

output "secondary_access_key" {
  description = "Secondary access key for the storage account"
  value       = azurerm_storage_account.main.secondary_access_key
  sensitive   = true
}

output "primary_connection_string" {
  description = "Primary connection string for the storage account"
  value       = azurerm_storage_account.main.primary_connection_string
  sensitive   = true
}

output "container_names" {
  description = "List of created container names"
  value       = [for container in azurerm_storage_container.containers : container.name]
}

output "resource_group_name" {
  description = "Name of the resource group"
  value       = local.resource_group_name
}
