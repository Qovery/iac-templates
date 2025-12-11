variable "region" {
  description = "AWS Region for the EC2 instance."
  type        = string
  default     = "eu-central-1" # Replace with your region
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance."
  type        = string
  default     = "ami-00d2efe5bc0683614" # Replace with a valid AMI ID for your region
}

variable "instance_type" {
    description = "Instance type for EC2"
    type = string
    default = "t2.micro"
}

variable "instance_name" {
    description = "Instance Name for EC2"
    type = string
    default = "qovery_server"
}

