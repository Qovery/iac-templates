output "cluster_id" {
  description = "ID of the DocumentDB cluster"
  value       = aws_docdb_cluster.main.id
}

output "cluster_arn" {
  description = "ARN of the DocumentDB cluster"
  value       = aws_docdb_cluster.main.arn
}

output "cluster_endpoint" {
  description = "Endpoint for the DocumentDB cluster"
  value       = aws_docdb_cluster.main.endpoint
}

output "cluster_reader_endpoint" {
  description = "Read-only endpoint for the DocumentDB cluster"
  value       = aws_docdb_cluster.main.reader_endpoint
}

output "cluster_port" {
  description = "Port on which the DocumentDB cluster accepts connections"
  value       = aws_docdb_cluster.main.port
}

output "master_username" {
  description = "Master username for the cluster"
  value       = aws_docdb_cluster.main.master_username
  sensitive   = true
}

output "master_password" {
  description = "Master password for the cluster"
  value       = random_password.master_password.result
  sensitive   = true
}

output "cluster_resource_id" {
  description = "Resource ID of the DocumentDB cluster"
  value       = aws_docdb_cluster.main.cluster_resource_id
}

output "instance_ids" {
  description = "List of DocumentDB instance IDs"
  value       = aws_docdb_cluster_instance.main[*].id
}

output "instance_arns" {
  description = "List of DocumentDB instance ARNs"
  value       = aws_docdb_cluster_instance.main[*].arn
}
