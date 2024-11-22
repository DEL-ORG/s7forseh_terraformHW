# Output the S3 bucket name
output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.my_bucket.bucket
}

# Output the IAM user name
output "iam_user_name" {
  description = "The name of the IAM user"
  value       = aws_iam_user.s3_user.name
}

# # Output the ARN of the IAM policy attached to the user
# output "iam_policy_arn" {
#   description = "The ARN of the IAM policy attached to the user"
#   value       = aws_iam_policy.s3_access_policy.arn
# }

