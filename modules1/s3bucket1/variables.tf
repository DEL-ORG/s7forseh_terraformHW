variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "iam_user_name" {
  description = "The name of the IAM user"
  type        = string
  default     = "s3-user"
}

variable "aws_region" {
  description = "The AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}
