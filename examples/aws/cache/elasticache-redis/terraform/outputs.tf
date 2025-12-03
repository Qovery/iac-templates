output "replication_group_id" {
  description = "ID of the ElastiCache replication group"
  value       = aws_elasticache_replication_group.redis.id
}

output "replication_group_arn" {
  description = "ARN of the ElastiCache replication group"
  value       = aws_elasticache_replication_group.redis.arn
}

output "primary_endpoint_address" {
  description = "Address of the primary endpoint"
  value       = aws_elasticache_replication_group.redis.primary_endpoint_address
}

output "reader_endpoint_address" {
  description = "Address of the reader endpoint"
  value       = aws_elasticache_replication_group.redis.reader_endpoint_address
}

output "port" {
  description = "Port number on which the Redis cluster accepts connections"
  value       = aws_elasticache_replication_group.redis.port
}

output "cluster_enabled" {
  description = "Indicates if cluster mode is enabled"
  value       = aws_elasticache_replication_group.redis.cluster_enabled
}

output "member_clusters" {
  description = "List of member cluster IDs"
  value       = aws_elasticache_replication_group.redis.member_clusters
}
