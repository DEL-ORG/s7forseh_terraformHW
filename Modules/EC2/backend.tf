terraform {
  backend "s3" {
    bucket  = "enanga"                      # Replace with your existing S3 bucket name
    key     = "ec2/terraform.tfstate" # Path for the state file in the bucket
    region  = "us-east-1"                   # AWS region of the S3 bucket
    encrypt = true                          # Encrypt the state file in the bucket
  }
}
