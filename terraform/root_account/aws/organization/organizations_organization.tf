resource "aws_organizations_organization" "tfer--Bryan-0020-Valencia" {
  aws_service_access_principals = ["sso.amazonaws.com"]
  feature_set                   = "ALL"
}

resource "aws_organizations_organization" "tfer--Prod" {
  aws_service_access_principals = ["sso.amazonaws.com"]
  feature_set                   = "ALL"
}
