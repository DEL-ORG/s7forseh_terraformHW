# Route Table for Private Subnets
resource "aws_route_table" "private" {
  count  = length(aws_subnet.private)
  vpc_id = aws_vpc.studyg-vpc.id

  tags = {
    Name = format("%s-%s-private-rout-%d", var.tags["environment"], var.tags["project"], count.index + 1)
  }
}

# Add Routes to NAT Gateways
resource "aws_route" "private" {
  count                  = length(aws_nat_gateway.nat)
  route_table_id         = aws_route_table.private[count.index].id
  destination_cidr_block = var.destination_cidr_block
  nat_gateway_id         = aws_nat_gateway.nat[count.index].id
}

# Associate Private Subnets with the Private Route Table
resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}