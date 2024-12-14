# Data block to fetch the existing VPC by its Name tag
# Fetch the default VPC
# data "aws_vpc" "dev-vpc" {
#   filter {
#     name   = "tag:Name"
#     values = ["dev-vpc"]
#   }
# }

data "aws_subnet" "subnet" {
  filter {
    name   = "tag:Name"
    values = ["dev-public-subnet"]
  }
}

data "aws_security_group" "security_group" {
  filter {
    name   = "tag:Name"
    values = ["EC2SecurityGroup"]
  }
}


# # Data block to fetch availability zones in the region
# data "aws_availability_zones" "available" {
#   state = "available"
# }
