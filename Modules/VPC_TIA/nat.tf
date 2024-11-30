# Create NAT Gateways
resource "aws_nat_gateway" "nat" {
  count         = var.tags.environment == "prod" ? 3 : 1
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = element(aws_subnet.public[*].id, count.index)

  tags = {
    Name = format("%s-%s-nat-%d", var.tags["environment"], var.tags["project"], count.index + 1)
  }
}