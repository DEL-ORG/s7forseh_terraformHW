# Allocate Elastic IPs for NAT Gateways
resource "aws_eip" "nat" {
  count = var.tags.environment == "prod" ? 3 : 1
  vpc   = true

  tags = {
    Name = format("%s-%s-eip-%d", var.tags["environment"], var.tags["project"], count.index + 1)
  }
}