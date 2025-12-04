output "instance_id" {
  description = "ID of the Filestore instance"
  value       = google_filestore_instance.main.id
}

output "instance_name" {
  description = "Name of the Filestore instance"
  value       = google_filestore_instance.main.name
}

output "tier" {
  description = "Filestore tier"
  value       = google_filestore_instance.main.tier
}

output "file_shares" {
  description = "List of file shares (name and capacity_gb)"
  value = [
    for fs in google_filestore_instance.main.file_shares :
    {
      name        = fs.name
      capacity_gb = fs.capacity_gb
    }
  ]
}

output "ip_addresses" {
  description = "Flattened list of IP addresses assigned to the instance networks"
  value       = flatten([for n in google_filestore_instance.main.networks : n.ip_addresses])
}

output "networks" {
  description = "Network blocks for the instance"
  value       = google_filestore_instance.main.networks
}