resource "aws_s3_bucket" "lambda_bucket" {
  bucket = "lambda.bryval.tech"
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
  key    = "getCount.zip"
  source = "../lambdas/getCount/getCount.zip"
}

resource "aws_s3_object" "updateCountCode" {
  bucket = aws_s3_bucket.lambda_bucket.bucket
  key    = "updateCount.zip"
  source = "../lambdas/updateCount/updateCount.zip"
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

