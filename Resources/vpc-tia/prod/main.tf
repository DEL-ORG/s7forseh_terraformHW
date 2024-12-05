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
    key            = "prod_vpc_tia/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "enangatable"
  }
}

locals {
  region                 = "us-east-1"
  cidr_block             = "10.0.0.0/16"
  destination_cidr_block = "0.0.0.0/0"
  tags = {
    "owner"          = "Gwyn"
    "teams"          = "DevOps"
    "environment"    = "prod"
    "project"        = "studyvpc-work"
    "create_by"      = "Gwen"
    "cloud_provider" = "aws"
  }
}

module "vpc2" {
  source                 = "../../../modules/VPC_TIA"
  region                 = local.region
  cidr_block             = local.cidr_block
  destination_cidr_block = local.destination_cidr_block
  tags                   = local.tags
}