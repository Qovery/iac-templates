terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "random_password" "master_password" {
  length  = 32
  special = true
}

resource "aws_docdb_subnet_group" "main" {
  count      = var.subnet_group_name == null && length(var.subnet_ids) > 0 ? 1 : 0
  name       = "${var.cluster_identifier}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = merge(
    {
      Name      = "${var.cluster_identifier}-subnet-group"
      CreatedBy = "QoveryDemo"
    },
    var.tags
  )
}

resource "aws_docdb_cluster" "main" {
  cluster_identifier = var.cluster_identifier
  engine             = "docdb"
  engine_version     = var.engine_version

  master_username = var.master_username
  master_password = random_password.master_password.result

  db_subnet_group_name   = var.subnet_group_name != null ? var.subnet_group_name : (length(aws_docdb_subnet_group.main) > 0 ? aws_docdb_subnet_group.main[0].name : null)
  vpc_security_group_ids = var.vpc_security_group_ids

  backup_retention_period      = var.backup_retention_period
  preferred_backup_window      = var.preferred_backup_window
  preferred_maintenance_window = var.preferred_maintenance_window

  storage_encrypted = var.storage_encrypted
  kms_key_id        = var.kms_key_id

  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports

  deletion_protection       = var.deletion_protection
  skip_final_snapshot       = var.skip_final_snapshot
  final_snapshot_identifier = var.skip_final_snapshot ? null : "${var.cluster_identifier}-final-snapshot"

  db_cluster_parameter_group_name = var.db_cluster_parameter_group_name

  tags = merge(
    {
      Name      = var.cluster_identifier
      CreatedBy = "QoveryDemo"
    },
    var.tags
  )
}

resource "aws_docdb_cluster_instance" "main" {
  count              = var.instance_count
  identifier         = "${var.cluster_identifier}-${count.index}"
  cluster_identifier = aws_docdb_cluster.main.id
  instance_class     = var.instance_class

  auto_minor_version_upgrade = var.auto_minor_version_upgrade

  tags = merge(
    {
      Name      = "${var.cluster_identifier}-${count.index}"
      CreatedBy = "QoveryDemo"
    },
    var.tags
  )
}
