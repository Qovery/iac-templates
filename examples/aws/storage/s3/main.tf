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

resource "aws_s3_bucket" "main" {
  bucket        = "${var.bucket_prefix}-${random_id.bucket_suffix.hex}"
  force_destroy = true

  tags = {
    CreatedBy = "QoveryDemo"
  }
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}
