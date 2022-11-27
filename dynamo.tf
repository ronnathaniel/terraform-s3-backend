
/*
 * COPYRIGHT: terraform-s3-backend.
 * All Rights Reserved.
 */

resource "aws_dynamodb_table" "state_lock" {
  name           = var.dynamo_table_name
  read_capacity  = var.dynamo_read_capacity
  write_capacity = var.dynamo_write_capacity
  hash_key       = var.dynamo_hash_key

  stream_enabled   = false
  stream_view_type = ""

  attribute {
    name = var.dynamo_hash_key
    type = "S"
  }

  tags = {
    ManagedByTerraform = "true"
    TerraformModule    = "terraform-s3-backend"
    Description        = var.dynamo_table_description
  }
}