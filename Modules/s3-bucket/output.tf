# Output the S3 bucket 
output "s3_bucket_name" {
  value = aws_s3_bucket.terraform_state.bucket
}