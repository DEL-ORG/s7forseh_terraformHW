data "aws_vpc" "vpc_tia" {
  filter {
    name   = "tag:Name"
    values = [format("%s-%s-vpc", var.tags["environment"], var.tags["project"])]
  }
}

data "aws_subnet" "private-subnet" {
   count = lookup(var.subnet_count, var.tags.environment)

  filter {
    name   = "tag:Name"
    values = [format("%s-%s-private-subnet-%d", var.tags["environment"], var.tags["project"], count.index + 1)]
  }
}

#ssh -i jenkins-keypair.pem ubuntu@10.20.101.154   cd ..









# Data block to fetch the existing VPC by its Name tag
# Fetch the default VPC
# data "aws_vpc" "dev-vpc" {
#   filter {
#     name   = "tag:Name"
#     values = ["dev-vpc"]
#   }
# }

# data "aws_subnet" "subnet" {
#   filter {
#     name   = "tag:Name"
#     values = ["dev-public-subnet"]
#   }
# }

# data "aws_security_group" "security_group" {
#   filter {
#     name   = "tag:Name"
#     values = ["EC2SecurityGroup"]
#   }
# }


# # Data block to fetch availability zones in the region
# data "aws_availability_zones" "available" {
#   state = "available"
# }
