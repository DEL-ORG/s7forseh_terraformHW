resource "aws_security_group" "private-sg" {
  name        = format("%s-%s-private-sg", var.tags["environment"], var.tags["project"])
  vpc_id      =  data.aws_vpc.vpc_tia.id #data.aws_vpc.vpc_tia.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name    =  format("%s-%s-private-sg", var.tags["environment"], var.tags["project"]) 
  }
}