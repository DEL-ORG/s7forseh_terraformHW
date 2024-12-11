# variables.tf
variable "ami_id" {
  description = "The AMI ID for my EC2 instance."
  type        = string
  # default     = "ami-06b21ccaeff8cd686"
}

variable "instance_type" {
  description = "The instance type you will use for the EC2 instance."
  type        = string
  # default     = "t2.micro"
}

variable "key_name" {
  description = "The key pair name for SSH access to the EC2 instance."
  type        = string
  sensitive   = true


}

# variable "subnet_id" {
#   description = "The subnet ID where the instance will be launched."
#   type        = string

# }

variable "associate_public_ip" {
  description = "Whether to associate a public IP address with the instance."
  type        = bool
  default     = true
}

variable "instance_name" {
  description = "The Name tag for the EC2 instance."
  type        = string
  # default     = "EC2_1"
}

variable "aws_region" {
  description = "The AWS region in which to launch the instance."
  type        = string
  # default     = "us-east-1"
}

variable "availability_zone" {
  description = "The AWS availability zone to deploy the subnet"
  type        = string
  default     = "us-east-1a"
}

variable "vpc_name" {
  description = "The name of the existing VPC"
  type        = string


}

variable "tags" {
  type = map(any)
}

