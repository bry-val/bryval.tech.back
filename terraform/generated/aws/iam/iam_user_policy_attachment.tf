resource "aws_iam_user_policy_attachment" "tfer--GithubServiceAccount_AmazonDynamoDBFullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  user       = "GithubServiceAccount"
}

resource "aws_iam_user_policy_attachment" "tfer--GithubServiceAccount_AmazonS3FullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  user       = "GithubServiceAccount"
}
