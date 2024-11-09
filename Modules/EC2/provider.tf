terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0" # Specify a version as needed
    }
  }
}

provider "aws" {
  region = "us-east-1"  # Ensure no spaces around "us-east-1"
}


