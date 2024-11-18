variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "The AWS region to deploy resources in."
}

variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket. Must be globally unique."
}

variable "environment" {
  type        = string
  description = "The environment for tagging purposes (e.g., Dev, Prod)."
  default     = "Dev"
}

