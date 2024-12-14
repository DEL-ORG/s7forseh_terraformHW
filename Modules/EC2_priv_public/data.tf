data "aws_vpc" "selected_vpc" {
  id = var.vpc_id
}

data "aws_security_group" "selected_sg" {
  id = var.security_group_id
}

