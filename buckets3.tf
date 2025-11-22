resource "aws_s3_bucket" "customers-backend" {
  bucket = var.bucket_name_backend
  tags   = var.tags
}
