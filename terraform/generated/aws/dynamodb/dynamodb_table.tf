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
