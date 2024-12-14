# Public EC2 Instance
resource "aws_instance" "public_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [data.aws_security_group.selected_sg.id]
  associate_public_ip_address = true
  key_name               = var.key_pair_name

  tags = {
    Name = "PublicInstance"
  }
}

# Private EC2 Instance
resource "aws_instance" "private_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [data.aws_security_group.selected_sg.id]
  associate_public_ip_address = false
  key_name               = var.key_pair_name

  tags = {
    Name = "PrivateInstance"
  }
}

# Security Group Rule: Allow SSH from Public to Private EC2
resource "aws_security_group_rule" "allow_public_to_private" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = data.aws_security_group.selected_sg.id
  source_security_group_id = data.aws_security_group.selected_sg.id
}
