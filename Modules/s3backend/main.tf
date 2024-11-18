# Create a DynamoDB table for state locking
resource "aws_dynamodb_table" "terraform_state_lock" {
  name         = "enangatable"     # Name of the DynamoDB table
  billing_mode = "PAY_PER_REQUEST" # On-demand pricing
  hash_key     = "LockID"          # Partition key

  attribute {
    name = "LockID"
    type = "S" # String type for LockID
  }

  tags = {
    Name        = "enangatable"
    Environment = "Production"
  }
}

