terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

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

resource "aws_s3_bucket" "lambda_bucket" {
  bucket = "lambdas.bryval.tech"
}

resource "aws_s3_bucket_ownership_controls" "lambda_bucket" {
  bucket = aws_s3_bucket.lambda_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "lambda_bucket" {
  depends_on = [aws_s3_bucket_ownership_controls.lambda_bucket]

  bucket = aws_s3_bucket.lambda_bucket.id
  acl    = "private"
}

resource "aws_s3_object" "getCountCode" {
  bucket = aws_s3_bucket.lambda_bucket.bucket
  key    = "lambda_function.zip"
  source = "path_to_your_local_file/lambda_function.zip" # replace with your local file path
  etag   = filemd5("path_to_your_local_file/lambda_function.zip") # replace with your local file path
}

resource "aws_s3_object" "updateCountCode" {
  bucket = aws_s3_bucket.lambda_bucket.bucket
  key    = "lambda_function.zip"
  source = "path_to_your_local_file/lambda_function.zip" # replace with your local file path
  etag   = filemd5("path_to_your_local_file/lambda_function.zip") # replace with your local file path
}

resource "aws_lambda_function" "getCount" {
  function_name = "getCount"
  role          = aws_iam_role.databaseRW.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"
  s3_bucket = aws_s3_bucket.lambda_bucket.bucket
  s3_key    = aws_s3_object.getCountCode.key
  depends_on = [aws_s3_object.getCountCode]
}

resource "aws_lambda_function" "updateCount" {
  function_name = "updateCount"
  role          = aws_iam_role.databaseRW.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"
  s3_bucket = aws_s3_bucket.lambda_bucket.bucket
  s3_key    = aws_s3_object.updateCountCode.key
  depends_on = [aws_s3_object.updateCountCode]
}

