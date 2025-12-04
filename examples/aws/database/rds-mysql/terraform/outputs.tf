output "db_instance_id" {
  description = "ID of the RDS instance"
  value       = aws_db_instance.mysql.id
}

output "db_instance_arn" {
  description = "ARN of the RDS instance"
  value       = aws_db_instance.mysql.arn
}

output "db_instance_endpoint" {
  description = "Connection endpoint for the RDS instance"
  value       = aws_db_instance.mysql.endpoint
}

output "db_instance_address" {
  description = "Address of the RDS instance"
  value       = aws_db_instance.mysql.address
}

output "db_instance_port" {
  description = "Port of the RDS instance"
  value       = aws_db_instance.mysql.port
}

output "db_name" {
  description = "Name of the database"
  value       = aws_db_instance.mysql.db_name
}

output "master_username" {
  description = "Master username for the database"
  value       = aws_db_instance.mysql.username
  sensitive   = true
}

output "master_password" {
  description = "Master password for the database"
  value       = random_password.db_password.result
  sensitive   = true
}
