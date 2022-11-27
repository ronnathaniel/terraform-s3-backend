
/*
 * COPYRIGHT: terraform-s3-backend.
 * All Rights Reserved.
 */

terraform {
  backend "s3" {
    bucket = aws_s3_bucket.state.bucket
    key = "tf-state"
    region = var.aws_region
  }
}