
data "aws_security_group" "security_group" {
  filter {
    name   = "tag:Name"
    values = ["EC2SecurityGroup"]
  }
}
