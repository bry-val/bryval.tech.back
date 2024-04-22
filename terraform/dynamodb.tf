data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

resource "aws_iam_policy" "AWSLambdaMicroserviceExecutionRole" {
  name = "AWSLambdaMicroserviceExecutionRole"
  path = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "dynamodb:DeleteItem",
        "dynamodb:GetItem",
        "dynamodb:PutItem",
        "dynamodb:Scan",
        "dynamodb:UpdateItem"
      ],
      "Effect": "Allow",
      "Resource": arn:aws:dynamodb:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:table/*
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_role" "databaseRW" {
  name                 = "databaseRW"
  path                 = "/service-role/"
  managed_policy_arns  = [aws_iam_policy.AWSLambdaMicroserviceExecutionRole.arn]
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_role_policy_attachment" "lambda_role_attach" {
  role       = aws_iam_role.databaseRW.name
  policy_arn = aws_iam_policy.AWSLambdaMicroserviceExecutionRole.arn
}

resource "aws_dynamodb_table" "bryval-update" {
  attribute {
    name = "counter"
    type = "N"
  }

  billing_mode                = "PAY_PER_REQUEST"
  deletion_protection_enabled = "false"
  hash_key                    = "counter"
  name                        = "bryval-update"

}
