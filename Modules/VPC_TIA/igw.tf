# Create an Internet Gateway (IGW)
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.studyg-vpc.id

  tags = {
    Name = format("%s-%s-igw", var.tags ["environment"], var.tags["project"])
  }
}
