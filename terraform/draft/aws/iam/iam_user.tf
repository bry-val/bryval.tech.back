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
