terraform {
  required_version = ">= 1.0.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = local.aws_region
}

terraform {
  backend "s3" {
    bucket  = "enanga"                # Replace with your existing S3 bucket name
    key     = "_prod_ec2/terraform.tfstate" # Path for the state file in the bucket
    region  = "us-east-1"             # AWS region of the S3 bucket
    encrypt = true                    # Encrypt the state file in the bucket
  }
}

locals {
  aws_region    = "us-east-1"
  ami_id        = "ami-06b21ccaeff8cd686"
  instance_type = "t2.micro" 
  key_name      = "terr_server_key"
  instance_name = "EC2_terraform"
  subnet_id     = "subnet-08ddd191bda975ec4"
  vpc_name      = "Default"

  tags = {
    "owner"          = "Gwyn"
    "teams"          = "DevOps"
    "environment"    = "prod"
    "project"        = "studyec2-work"
    "create_by"      = "Gwen"
    "cloud_provider" = "aws"
  }
}

module "EC2" {
  source                 = "../../../modules/EC2"
  aws_region             = local.aws_region
  ami_id                 = local.ami_id
  instance_type          = local.instance_type
  key_name               = local.key_name
  instance_name          = local.instance_name
  subnet_id              = local.subnet_id
  vpc_name               = local.vpc_name
  tags                   = local.tags

}