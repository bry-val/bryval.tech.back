resource "aws_lambda_function" "tfer--getCount" {
  architectures = ["x86_64"]

  ephemeral_storage {
    size = "512"
  }

  function_name = "getCount"
  handler       = "lambda_function.lambda_handler"

  logging_config {
    log_format = "Text"
    log_group  = "/aws/lambda/getCount"
  }

  memory_size                    = "128"
  package_type                   = "Zip"
  reserved_concurrent_executions = "-1"
  role                           = "arn:aws:iam::905418446214:role/service-role/databaseRW"
  runtime                        = "python3.12"
  skip_destroy                   = "false"
  source_code_hash               = "N6RrKkVrc8zNHohyP29CcfrZmlZmGAe6EtFf158slEc="
  timeout                        = "3"

  tracing_config {
    mode = "PassThrough"
  }
}

resource "aws_lambda_function" "tfer--updateCount" {
  architectures = ["x86_64"]

  ephemeral_storage {
    size = "512"
  }

  function_name = "updateCount"
  handler       = "lambda_function.lambda_handler"

  logging_config {
    log_format = "Text"
    log_group  = "/aws/lambda/updateCount"
  }

  memory_size                    = "128"
  package_type                   = "Zip"
  reserved_concurrent_executions = "-1"
  role                           = "arn:aws:iam::905418446214:role/service-role/databaseRW"
  runtime                        = "python3.12"
  skip_destroy                   = "false"
  source_code_hash               = "LOk57mbMWCiVVcBX2alhDEka0ROjUDPVJ+6noIYr+zg="
  timeout                        = "3"

  tracing_config {
    mode = "PassThrough"
  }
}
