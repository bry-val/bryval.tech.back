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
