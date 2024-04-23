provider "aws" {
  region = "us-east-1"
}

resource "aws_api_gateway_rest_api" "api" {
  name        = "bryval-tech-counter"
  description = "API for the /count endpoint"
}

resource "aws_api_gateway_integration" "getCount" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.getCount.id
  http_method = aws_api_gateway_method.getCount.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.getCount.invoke_arn
  depends_on = [ aws_lambda_function.getCount ]
}

resource "aws_api_gateway_integration" "updateCount" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.updateCount.id
  http_method = aws_api_gateway_method.updateCount.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.updateCount.invoke_arn
  depends_on = [ aws_lambda_function.updateCount ]
}