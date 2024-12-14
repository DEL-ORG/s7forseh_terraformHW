# # ec2_ins.terraform {
# resource "aws_instance" "ec2_instance" {
#   ami                         = var.ami_id
#   instance_type               = var.instance_type
#   key_name                    = var.key_name
#   subnet_id                   = var.subnet_id
#   associate_public_ip_address = var.associate_public_ip

#   tags = {
#     Name = var.instance_name
#   }
# }
# #Use an existing VPC
# data "aws_vpc" "testvpc" {
#   filter {
#     name   = "tag:Name"
#     values = [var.vpc_name] # Replace with your existing VPC name
#   }
# }


# # Create a subnet
# resource "aws_subnet" "main_subnet" {
#   vpc_id            = data.aws_vpc.default.id
#   # cidr_block        = "10.0.0.0/16"
#   availability_zone = var.availability_zone

#   tags = {
#     Name = "MainSubnet"
#   }
# }

# Create a security group for the EC2 instance
# resource "aws_security_group" "security_group1" {
#   name_prefix = "ec2-security-group-"

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "EC2SecurityGroup"
#   }
# }

# Create an EC2 instance
resource "aws_instance" "EC2_1" {
  subnet_id              = data.aws_subnet.subnet.id
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [data.aws_security_group.security_group.id]

  # security_groups = [aws_security_group.security_group1.name]

  tags = {
    Name = "EC2_bastion"
  }
}

