resource "aws_s3_bucket" "this" {
  bucket = var.s3_bucket
  force_destroy = true
  acl = "private"

  tags = {
    Name        = var.s3_bucket_name
  }

  versioning {
    enabled = true
  }
}