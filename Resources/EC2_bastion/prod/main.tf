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
  region = local.region
}

terraform {
  backend "s3" {
    bucket         = "enanga"
    key            = "prod_bastion/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "enangatable"
  }
}
locals {
  ami           = "ami-01816d07b1128cd2d"
  instance_type = "t2.small"
  region        = "us-east-1"
  key_name      = "terr_server_key"

  tags = {
    "owner"          = "Gwyn"
    "teams"          = "DevOps"
    "environment"    = "prod"
    "project"        = "studyvpc-work"
    "create_by"      = "Gwen"
    "cloud_provider" = "aws"
  }

}

module "bastion_host" {
  source        = "../../../modules/EC2_bastion"
  ami           = local.ami
  instance_type = local.instance_type
  region        = local.region
  key_name      = local.key_name
  tags          = local.tags
}