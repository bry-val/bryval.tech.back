resource "aws_acm_certificate" "tfer--5ca53b03-002D-f429-002D-42b3-002D-9ad0-002D-77672d934e7f_bryval-002E-tech" {
  domain_name   = "bryval.tech"
  key_algorithm = "RSA_2048"

  options {
    certificate_transparency_logging_preference = "ENABLED"
  }

  subject_alternative_names = ["bryval.tech", "*.bryval.tech"]
  validation_method         = "DNS"
}

resource "aws_cloudfront_distribution" "tfer--E1ULMG9K6R52JJ" {
  aliases = ["www.bryval.tech"]

  default_cache_behavior {
    allowed_methods        = ["HEAD", "GET"]
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    cached_methods         = ["HEAD", "GET"]
    compress               = "true"
    default_ttl            = "0"
    max_ttl                = "0"
    min_ttl                = "0"
    smooth_streaming       = "false"
    target_origin_id       = "www.bryval.tech.s3.us-east-1.amazonaws.com"
    viewer_protocol_policy = "redirect-to-https"
  }

  default_root_object = "index.html"
  enabled             = "true"
  http_version        = "http2"
  is_ipv6_enabled     = "true"

  origin {
    connection_attempts = "3"
    connection_timeout  = "10"
    domain_name         = "www.bryval.tech.s3.us-east-1.amazonaws.com"
    origin_id           = "www.bryval.tech.s3.us-east-1.amazonaws.com"

    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/E135PQ7T644Q1U"
    }
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  retain_on_delete = "false"
  staging          = "false"

  viewer_certificate {
    acm_certificate_arn            = "arn:aws:acm:us-east-1:905418446214:certificate/5ca53b03-f429-42b3-9ad0-77672d934e7f"
    cloudfront_default_certificate = "false"
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
  }
}

resource "aws_cloudfront_distribution" "tfer--EY8DKP6IFJJSH" {
  aliases = ["bryval.tech"]

  default_cache_behavior {
    allowed_methods        = ["HEAD", "GET"]
    cache_policy_id        = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad"
    cached_methods         = ["HEAD", "GET"]
    compress               = "true"
    default_ttl            = "0"
    max_ttl                = "0"
    min_ttl                = "0"
    smooth_streaming       = "false"
    target_origin_id       = "bryval.tech.s3-website-us-east-1.amazonaws.com"
    viewer_protocol_policy = "redirect-to-https"
  }

  enabled         = "true"
  http_version    = "http2"
  is_ipv6_enabled = "true"

  origin {
    connection_attempts = "3"
    connection_timeout  = "10"

    custom_origin_config {
      http_port                = "80"
      https_port               = "443"
      origin_keepalive_timeout = "5"
      origin_protocol_policy   = "http-only"
      origin_read_timeout      = "30"
      origin_ssl_protocols     = ["SSLv3", "TLSv1.2", "TLSv1.1", "TLSv1"]
    }

    domain_name = "bryval.tech.s3-website-us-east-1.amazonaws.com"
    origin_id   = "bryval.tech.s3-website-us-east-1.amazonaws.com"
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  retain_on_delete = "false"
  staging          = "false"

  viewer_certificate {
    acm_certificate_arn            = "arn:aws:acm:us-east-1:905418446214:certificate/5ca53b03-f429-42b3-9ad0-77672d934e7f"
    cloudfront_default_certificate = "false"
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
  }
}

resource "aws_dynamodb_table" "tfer--bryval-002D-update" {
  attribute {
    name = "counter"
    type = "N"
  }

  billing_mode                = "PAY_PER_REQUEST"
  deletion_protection_enabled = "false"
  hash_key                    = "counter"
  name                        = "bryval-update"

  point_in_time_recovery {
    enabled = "false"
  }

  read_capacity  = "0"
  stream_enabled = "false"
  table_class    = "STANDARD"
  write_capacity = "0"
}

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

resource "aws_iam_role" "tfer--AWSReservedSSO_PowerUserAccess_c7ae13e87abf0466" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "sts:AssumeRoleWithSAML",
        "sts:TagSession"
      ],
      "Condition": {
        "StringEquals": {
          "SAML:aud": "https://signin.aws.amazon.com/saml"
        }
      },
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::905418446214:saml-provider/AWSSSO_445c371eedb8500c_DO_NOT_DELETE"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  managed_policy_arns  = ["arn:aws:iam::aws:policy/PowerUserAccess"]
  max_session_duration = "43200"
  name                 = "AWSReservedSSO_PowerUserAccess_c7ae13e87abf0466"
  path                 = "/aws-reserved/sso.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForAPIGateway" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ops.apigateway.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "The Service Linked Role is used by Amazon API Gateway."
  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/APIGatewayServiceRolePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForAPIGateway"
  path                 = "/aws-service-role/ops.apigateway.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForOrganizations" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "organizations.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Service-linked role used by AWS Organizations to enable integration of other AWS services with Organizations."
  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSOrganizationsServiceTrustPolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForOrganizations"
  path                 = "/aws-service-role/organizations.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForSSO" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "sso.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Service-linked role used by AWS SSO to manage AWS resources, including IAM roles, policies and SAML IdP on your behalf."
  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSSSOServiceRolePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForSSO"
  path                 = "/aws-service-role/sso.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForSupport" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "support.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Enables resource access for AWS to provide billing, administrative and support services"
  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSSupportServiceRolePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForSupport"
  path                 = "/aws-service-role/support.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForTrustedAdvisor" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "trustedadvisor.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Access for the AWS Trusted Advisor Service to help reduce cost, increase performance, and improve security of your AWS environment."
  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSTrustedAdvisorServiceRolePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForTrustedAdvisor"
  path                 = "/aws-service-role/trustedadvisor.amazonaws.com/"
}

resource "aws_iam_role" "tfer--OrganizationAccountAccessRole" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::905418229056:root"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  managed_policy_arns  = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  max_session_duration = "3600"
  name                 = "OrganizationAccountAccessRole"
  path                 = "/"
}

resource "aws_iam_role" "tfer--databaseRW" {
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

  managed_policy_arns  = ["arn:aws:iam::905418446214:policy/service-role/AWSLambdaBasicExecutionRole-92d88dc7-446e-4b7c-8e28-25fcaa26ad6a", "arn:aws:iam::905418446214:policy/service-role/AWSLambdaMicroserviceExecutionRole-fe178409-fdaa-4436-b9ed-17cef86ceb71"]
  max_session_duration = "3600"
  name                 = "databaseRW"
  path                 = "/service-role/"
}

resource "aws_iam_role" "tfer--getCount-002D-role-002D-6e4uduy7" {
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

  managed_policy_arns  = ["arn:aws:iam::905418446214:policy/service-role/AWSLambdaBasicExecutionRole-03ce626f-065a-47ad-bbca-2009e4a9795a"]
  max_session_duration = "3600"
  name                 = "getCount-role-6e4uduy7"
  path                 = "/service-role/"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSReservedSSO_PowerUserAccess_c7ae13e87abf0466_PowerUserAccess" {
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
  role       = "AWSReservedSSO_PowerUserAccess_c7ae13e87abf0466"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForAPIGateway_APIGatewayServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/APIGatewayServiceRolePolicy"
  role       = "AWSServiceRoleForAPIGateway"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForOrganizations_AWSOrganizationsServiceTrustPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSOrganizationsServiceTrustPolicy"
  role       = "AWSServiceRoleForOrganizations"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForSSO_AWSSSOServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSSSOServiceRolePolicy"
  role       = "AWSServiceRoleForSSO"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForSupport_AWSSupportServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSSupportServiceRolePolicy"
  role       = "AWSServiceRoleForSupport"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForTrustedAdvisor_AWSTrustedAdvisorServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSTrustedAdvisorServiceRolePolicy"
  role       = "AWSServiceRoleForTrustedAdvisor"
}

resource "aws_iam_role_policy_attachment" "tfer--OrganizationAccountAccessRole_AdministratorAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = "OrganizationAccountAccessRole"
}

resource "aws_iam_role_policy_attachment" "tfer--databaseRW_AWSLambdaBasicExecutionRole-002D-92d88dc7-002D-446e-002D-4b7c-002D-8e28-002D-25fcaa26ad6a" {
  policy_arn = "arn:aws:iam::905418446214:policy/service-role/AWSLambdaBasicExecutionRole-92d88dc7-446e-4b7c-8e28-25fcaa26ad6a"
  role       = "databaseRW"
}

resource "aws_iam_role_policy_attachment" "tfer--databaseRW_AWSLambdaMicroserviceExecutionRole-002D-fe178409-002D-fdaa-002D-4436-002D-b9ed-002D-17cef86ceb71" {
  policy_arn = "arn:aws:iam::905418446214:policy/service-role/AWSLambdaMicroserviceExecutionRole-fe178409-fdaa-4436-b9ed-17cef86ceb71"
  role       = "databaseRW"
}

resource "aws_iam_role_policy_attachment" "tfer--getCount-002D-role-002D-6e4uduy7_AWSLambdaBasicExecutionRole-002D-03ce626f-002D-065a-002D-47ad-002D-bbca-002D-2009e4a9795a" {
  policy_arn = "arn:aws:iam::905418446214:policy/service-role/AWSLambdaBasicExecutionRole-03ce626f-065a-47ad-bbca-2009e4a9795a"
  role       = "getCount-role-6e4uduy7"
}

resource "aws_iam_user" "tfer--AIDA5FTZFCWDBZ456FQ2Q" {
  force_destroy = "false"
  name          = "GithubServiceAccount"
  path          = "/"

  tags = {
    AKIA5FTZFCWDDHGQESVI = "GithubActionsAccessKey"
  }

  tags_all = {
    AKIA5FTZFCWDDHGQESVI = "GithubActionsAccessKey"
  }
}

resource "aws_iam_user_policy" "tfer--GithubServiceAccount_InvalidateCloudFrontCache" {
  name = "InvalidateCloudFrontCache"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "cloudfront:CreateInvalidation",
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  user = "GithubServiceAccount"
}

resource "aws_iam_user_policy_attachment" "tfer--GithubServiceAccount_AmazonDynamoDBFullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  user       = "GithubServiceAccount"
}

resource "aws_iam_user_policy_attachment" "tfer--GithubServiceAccount_AmazonS3FullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  user       = "GithubServiceAccount"
}

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

resource "aws_route53_record" "tfer--Z0539360HO2D3498EEKG_bryval-002E-tech-002E-_A_" {
  alias {
    evaluate_target_health = "false"
    name                   = "d36dx4e6064lr6.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
  }

  multivalue_answer_routing_policy = "false"
  name                             = "bryval.tech"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--Z0539360HO2D3498EEKG_bryval-002E-tech.zone_id}"
}

resource "aws_route53_record" "tfer--Z0539360HO2D3498EEKG_bryval-002E-tech-002E-_NS_" {
  multivalue_answer_routing_policy = "false"
  name                             = "bryval.tech"
  records                          = ["ns-1766.awsdns-28.co.uk.", "ns-706.awsdns-24.net.", "ns-1128.awsdns-13.org.", "ns-487.awsdns-60.com."]
  ttl                              = "172800"
  type                             = "NS"
  zone_id                          = "${aws_route53_zone.tfer--Z0539360HO2D3498EEKG_bryval-002E-tech.zone_id}"
}

resource "aws_route53_record" "tfer--Z0539360HO2D3498EEKG_bryval-002E-tech-002E-_SOA_" {
  multivalue_answer_routing_policy = "false"
  name                             = "bryval.tech"
  records                          = ["ns-487.awsdns-60.com. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  ttl                              = "900"
  type                             = "SOA"
  zone_id                          = "${aws_route53_zone.tfer--Z0539360HO2D3498EEKG_bryval-002E-tech.zone_id}"
}

resource "aws_route53_record" "tfer--Z0539360HO2D3498EEKG_www-002E-bryval-002E-tech-002E-_A_" {
  alias {
    evaluate_target_health = "false"
    name                   = "dgka2t9w0hy18.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
  }

  multivalue_answer_routing_policy = "false"
  name                             = "www.bryval.tech"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--Z0539360HO2D3498EEKG_bryval-002E-tech.zone_id}"
}

resource "aws_route53_zone" "tfer--Z0539360HO2D3498EEKG_bryval-002E-tech" {
  force_destroy = "false"
  name          = "bryval.tech"
}

resource "aws_s3_bucket" "tfer--bryval-002E-tech" {
  bucket        = "bryval.tech"
  force_destroy = "false"

  grant {
    id          = "d697b6832338da4e44b56c9790bceef074a0d4bf4876cd846ef81c6d235069b9"
    permissions = ["FULL_CONTROL"]
    type        = "CanonicalUser"
  }

  object_lock_enabled = "false"
  request_payer       = "BucketOwner"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }

      bucket_key_enabled = "true"
    }
  }

  versioning {
    enabled    = "false"
    mfa_delete = "false"
  }

  website {
    redirect_all_requests_to = "https://www.bryval.tech"
  }
}

resource "aws_s3_bucket" "tfer--www-002E-bryval-002E-tech" {
  bucket        = "www.bryval.tech"
  force_destroy = "false"

  grant {
    id          = "d697b6832338da4e44b56c9790bceef074a0d4bf4876cd846ef81c6d235069b9"
    permissions = ["FULL_CONTROL"]
    type        = "CanonicalUser"
  }

  object_lock_enabled = "false"

  policy = <<POLICY
{
  "Id": "PolicyForCloudFrontPrivateContent",
  "Statement": [
    {
      "Action": "s3:GetObject",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity E135PQ7T644Q1U"
      },
      "Resource": "arn:aws:s3:::www.bryval.tech/*",
      "Sid": "1"
    }
  ],
  "Version": "2008-10-17"
}
POLICY

  request_payer = "BucketOwner"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }

      bucket_key_enabled = "true"
    }
  }

  versioning {
    enabled    = "false"
    mfa_delete = "false"
  }
}
