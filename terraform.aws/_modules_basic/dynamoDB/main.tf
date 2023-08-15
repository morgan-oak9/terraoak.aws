
resource "aws_dynamodb_table" "dynamo-db-table" {
  # oak9: Define asset inventory tags
  name                        = "sactestingtable"
  billing_mode                = "PROVISIONED"
  hash_key                    = "UserId"
  range_key                   = "GameTitle"
  read_capacity               = 1
  # oak9: Set Dynamo DB read capacity to a higher threshold
  write_capacity              = 1
  # oak9: Set DynamoDB write capacity to a higher threshold
  deletion_protection_enabled = true
  attribute {
    name = "UserId"
    type = "S"
  }
  attribute {
    name = "GameTitle"
    type = "S"
  }
  attribute {
    name = "TopScore"
    type = "N"
  }
  ttl {
    attribute_name = "TimeToExist"
    enabled        = true
  }
  point_in_time_recovery {
    enabled = false
  }
  timeouts {
    create = "10m"
    delete = "10m"
    update = "1h"
  }
  global_secondary_index {
    name               = "GameTitleIndex"
    hash_key           = "GameTitle"
    range_key          = "TopScore"
    write_capacity     = 1
    read_capacity      = 1
    projection_type    = "INCLUDE"
    non_key_attributes = ["UserId"]
  }
  server_side_encryption {
    enabled = false
  }
}
