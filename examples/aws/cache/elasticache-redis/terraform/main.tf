terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_elasticache_subnet_group" "redis" {
  count      = var.subnet_group_name == null && length(var.subnet_ids) > 0 ? 1 : 0
  name       = "${var.cluster_id}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = merge(
    {
      Name      = "${var.cluster_id}-subnet-group"
      CreatedBy = "QoveryDemo"
    },
    var.tags
  )
}

resource "aws_elasticache_replication_group" "redis" {
  replication_group_id = var.cluster_id
  description          = var.description

  engine               = "redis"
  engine_version       = var.engine_version
  node_type            = var.node_type
  num_cache_clusters   = var.num_cache_clusters
  parameter_group_name = var.parameter_group_name
  port                 = var.port

  subnet_group_name  = var.subnet_group_name != null ? var.subnet_group_name : (length(aws_elasticache_subnet_group.redis) > 0 ? aws_elasticache_subnet_group.redis[0].name : null)
  security_group_ids = var.security_group_ids

  automatic_failover_enabled = var.automatic_failover_enabled
  multi_az_enabled           = var.multi_az_enabled

  at_rest_encryption_enabled = var.at_rest_encryption_enabled
  transit_encryption_enabled = var.transit_encryption_enabled
  auth_token                 = var.transit_encryption_enabled && var.auth_token != null ? var.auth_token : null

  snapshot_retention_limit = var.snapshot_retention_limit
  snapshot_window          = var.snapshot_window
  maintenance_window       = var.maintenance_window

  auto_minor_version_upgrade = var.auto_minor_version_upgrade

  log_delivery_configuration {
    destination      = var.log_destination
    destination_type = var.log_destination_type
    log_format       = var.log_format
    log_type         = "slow-log"
  }

  log_delivery_configuration {
    destination      = var.log_destination
    destination_type = var.log_destination_type
    log_format       = var.log_format
    log_type         = "engine-log"
  }

  tags = merge(
    {
      Name      = var.cluster_id
      CreatedBy = "QoveryDemo"
    },
    var.tags
  )
}
