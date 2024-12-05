terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0" # Specify a version as needed
    }
  }
}

provider "aws" {
  region = var.aws_region # Ensure no spaces around "us-east-1"
}


