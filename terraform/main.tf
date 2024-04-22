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

resource "aws_acm_certificate" "cert" {
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
    cached_methods         = ["GET", "HEAD"]
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
    cached_methods         = ["GET", "HEAD"]
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
      origin_ssl_protocols     = ["TLSv1.2", "SSLv3", "TLSv1", "TLSv1.1"]
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

resource "aws_iam_user" "tfer--AIDA5FTZFCWDBZ456FQ2Q" {
  force_destroy = "false"
  name          = "GithubServiceAccount"
  path          = "/"

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
  records                          = ["ns-1766.awsdns-28.co.uk.", "ns-487.awsdns-60.com.", "ns-1128.awsdns-13.org.", "ns-706.awsdns-24.net."]
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
