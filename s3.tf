
/*
 * COPYRIGHT: terraform-s3-backend.
 * All Rights Reserved.
 */

resource "aws_s3_bucket" "state" {
  bucket = var.s3_bucket

  tags = {
    ManagedByTerraform = "true"
    TerraformModule    = "terraform-s3-backend"
    Description        = var.s3_state_bucket_description
  }
}

resource "aws_s3_bucket" "logs" {
  bucket = "${var.s3_bucket}-logs"
}

resource "aws_s3_bucket_policy" "state" {
  bucket = aws_s3_bucket.state.id
  policy = data.aws_iam_policy_document.state.json
}

resource "aws_s3_bucket_acl" "state" {
  bucket = aws_s3_bucket.state.id
  acl = "private"
}

resource "aws_s3_bucket_logging" "state" {
  bucket        = aws_s3_bucket.state.id
  target_bucket = aws_s3_bucket.logs.id
  target_prefix = "/logs"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "state" {
  bucket = aws_s3_bucket.state.id
  rule {}
}