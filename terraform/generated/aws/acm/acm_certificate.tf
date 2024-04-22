resource "aws_acm_certificate" "tfer--5ca53b03-002D-f429-002D-42b3-002D-9ad0-002D-77672d934e7f_bryval-002E-tech" {
  domain_name   = "bryval.tech"
  key_algorithm = "RSA_2048"

  options {
    certificate_transparency_logging_preference = "ENABLED"
  }

  subject_alternative_names = ["bryval.tech", "*.bryval.tech"]
  validation_method         = "DNS"
}
