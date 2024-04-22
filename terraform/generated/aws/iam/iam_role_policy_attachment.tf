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
