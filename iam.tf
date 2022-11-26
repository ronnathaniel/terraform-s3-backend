
/*
 * COPYRIGHT: terraform-s3-backend.
 * All Rights Reserved.
 */

data "aws_iam_policy_document" "state" {
  statement {
    sid = "RequireEncryptedTransport"
    effect = "Deny"
    actions = ["s3:*"]
    resources = ["${aws_s3_bucket.state.arn}/*"]
    condition {
      test     = "Bool"
      values   = [false]
      variable = "aws:SecureTransport"
    }
    principals {
      identifiers = ["*"]
      type        = "*"
    }
  }

  statement {
    sid = "RequireEncryptedStorage"
    effect = "Deny"
    actions = ["s3:PutObject"]
    resources = ["${aws_s3_bucket.state.arn}/*"]
    condition {
      test     = "StringNotEquals"
      values   = ["AES256"]
      variable = "s3:x-amz-server-side-encryption"
    }
    principals {
      identifiers = ["*"]
      type        = "*"
    }
  }
}