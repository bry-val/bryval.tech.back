resource "aws_iam_policy" "tfer--AWSLambdaBasicExecutionRole-002D-03ce626f-002D-065a-002D-47ad-002D-bbca-002D-2009e4a9795a" {
  name = "AWSLambdaBasicExecutionRole-03ce626f-065a-47ad-bbca-2009e4a9795a"
  path = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "logs:CreateLogGroup",
      "Effect": "Allow",
      "Resource": "arn:aws:logs:us-east-1:905418446214:*"
    },
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:us-east-1:905418446214:log-group:/aws/lambda/getCount:*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "tfer--AWSLambdaBasicExecutionRole-002D-92d88dc7-002D-446e-002D-4b7c-002D-8e28-002D-25fcaa26ad6a" {
  name = "AWSLambdaBasicExecutionRole-92d88dc7-446e-4b7c-8e28-25fcaa26ad6a"
  path = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "logs:CreateLogGroup",
      "Effect": "Allow",
      "Resource": "arn:aws:logs:us-east-1:905418446214:*"
    },
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:us-east-1:905418446214:log-group:/aws/lambda/updateCount:*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "tfer--AWSLambdaMicroserviceExecutionRole-002D-fe178409-002D-fdaa-002D-4436-002D-b9ed-002D-17cef86ceb71" {
  name = "AWSLambdaMicroserviceExecutionRole-fe178409-fdaa-4436-b9ed-17cef86ceb71"
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
      "Resource": "arn:aws:dynamodb:us-east-1:905418446214:table/*"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}
