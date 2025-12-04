output "instance_name" {
  description = "Name of the Cloud SQL instance"
  value       = google_sql_database_instance.postgresql.name
}

output "instance_connection_name" {
  description = "Connection name of the instance"
  value       = google_sql_database_instance.postgresql.connection_name
}

output "instance_self_link" {
  description = "Self link of the Cloud SQL instance"
  value       = google_sql_database_instance.postgresql.self_link
}

output "instance_ip_address" {
  description = "First public IP address of the instance"
  value       = length(google_sql_database_instance.postgresql.ip_address) > 0 ? google_sql_database_instance.postgresql.ip_address[0].ip_address : null
}

output "private_ip_address" {
  description = "First private IP address of the instance"
  value       = length(google_sql_database_instance.postgresql.private_ip_address) > 0 ? google_sql_database_instance.postgresql.private_ip_address : null
}

output "database_name" {
  description = "Name of the database"
  value       = google_sql_database.database.name
}

output "user_name" {
  description = "Database user name"
  value       = google_sql_user.user.name
  sensitive   = true
}

output "user_password" {
  description = "Database user password"
  value       = random_password.db_password.result
  sensitive   = true
}
