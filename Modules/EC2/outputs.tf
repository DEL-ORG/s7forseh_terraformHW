# outputs.tf
output "aws_instance" {
  description = "The ID of the EC2 instance."
  value       = aws_instance.webserver1.id
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance."
  value       = aws_instance.webserver1.public_ip
}

# output "vpc-name" {
#   description = "The public IP address of the EC2 instance."
#   value       = "testvpc"
# }

