# Outputs for the S3 Backend Module

# Output the name of the S3 bucket used for the Terraform backend
output "bucket_name" {
  description = "The name of the S3 bucket used for Terraform backend"
  value       = aws_s3_bucket.backend_bucket.bucket
}

# Output the region of the S3 bucket
output "bucket_region" {
  description = "The region where the S3 bucket is created"
  value       = aws_s3_bucket.backend_bucket.region
}

