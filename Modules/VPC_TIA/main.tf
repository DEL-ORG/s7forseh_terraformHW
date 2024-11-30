# Define VPC
resource "aws_vpc" "studyg-vpc" {
  cidr_block           = var.cidr_block
  tags = {
    Name = format("%s-%s-vpc", var.tags ["environment"], var.tags["project"])
  }
}

