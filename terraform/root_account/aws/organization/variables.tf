data "terraform_remote_state" "organization" {
  backend = "local"

  config = {
    path = "../../../generated/aws/organization/terraform.tfstate"
  }
}
