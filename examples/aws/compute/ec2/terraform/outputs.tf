output "ec2_instance_name" {
    description = "Name of EC2 Instance"
    value = aws_instance.ec2.tags.Name
}

output "public_ip" {
  description = "The public IP address of the EC2 instance."
  value       = aws_instance.ec2.public_ip
}

output "private_ip" {
  description = "The private IP address of the EC2 instance."
  value       = aws_instance.ec2.private_ip
}

output "public_dns" {
  description = "The public DNS name of the EC2 instance."
  value       = aws_instance.ec2.public_dns
}