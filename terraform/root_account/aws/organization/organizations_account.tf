resource "aws_organizations_account" "tfer--Bryan-0020-Valencia" {
  email     = "bryan@bryanvalencia.dev"
  name      = "Bryan Valencia"
  parent_id = "r-5wku"
}

resource "aws_organizations_account" "tfer--Prod" {
  email     = "bryan+projects@bryanvalencia.dev"
  name      = "Prod"
  parent_id = "${data.terraform_remote_state.organization.outputs.aws_organizations_organizational_unit_tfer--production_id}"
}
