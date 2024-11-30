# terraform {
#   backend "s3" {
#     bucket         = "enanga"
#     key            = "vpc_tia/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "enangatable"
#   }
# }