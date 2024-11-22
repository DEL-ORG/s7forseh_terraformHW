resource "aws_iam_user" "s3_user" {
  name = var.iam_user_name
}

resource "aws_iam_user_policy" "s3_user_policy" {
  name = "s3-user-policy"
  user = aws_iam_user.s3_user.name
  
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject"
        ],
        Resource = [
          "${aws_s3_bucket.my_bucket.arn}/*"
        ]
      },
      {
        Effect = "Allow",
        Action = [
          "s3:ListBucket"
        ],
        Resource = [aws_s3_bucket.my_bucket.arn]
      }
    ]
  })
}


