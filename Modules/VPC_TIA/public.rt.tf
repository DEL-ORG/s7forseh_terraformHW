# Route Table for Public Subnets (update to include IGW route)
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.studyg-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id             = aws_internet_gateway.igw.id
  }

  tags = {
    Name = format("%s-%s-public-route", var.tags ["environment"], var.tags["project"])
  }
}

# Associate Public Subnets with the Public Route Table
resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}
