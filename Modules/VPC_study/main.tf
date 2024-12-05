
# Create VPC
resource "aws_vpc" "studyvpc1" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.environment}-vpc"
  }
}

# Create Public Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.studyvpc1.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone

  tags = {
    Name = "${var.environment}-public-subnet"
  }
}

# Create Private Subnet
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.studyvpc1.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.availability_zone

  tags = {
    Name = "${var.environment}-private-subnet"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "studyigw" {
  vpc_id = aws_vpc.studyvpc1.id

  tags = {
    Name = "${var.environment}-igw"
  }
}

# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.studyvpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.studyigw.id
  }

  tags = {
    Name = "${var.environment}-public-route-table"
  }
}

# Associate Route Table with Public Subnet
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

