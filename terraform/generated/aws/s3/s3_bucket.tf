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
