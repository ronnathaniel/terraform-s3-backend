
/*
 * COPYRIGHT: terraform-s3-backend.
 * All Rights Reserved.
 */

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "s3_bucket" {
  type    = string
  default = "remote-state-tfstate"
}

variable "dynamo_table_name" {
  type    = string
  default = "remote-lock-tfstate"
}

variable "dynamo_read_capacity" {
  type    = number
  default = 1
}

variable "dynamo_write_capacity" {
  type    = number
  default = 1
}

variable "dynamo_hash_key" {
  type    = string
  default = "LockID"
}

variable "dynamo_table_description" {
  type    = string
  default = ""
}

variable "s3_state_bucket_description" {
  type    = string
  default = ""
}
