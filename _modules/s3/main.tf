# _modules/s3/main.tf
resource "aws_s3_bucket" "phamngoctuan-tfstate" {
  bucket = var.bucket_name
  force_destroy = true

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.app_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.app_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.app_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_lifecycle_rule" "lifecycle_rule" {
  bucket = aws_s3_bucket.app_bucket.id
  enabled = true

  transition {
    days          = 30
    storage_class = "STANDARD_IA"
  }

  noncurrent_version_transition {
    noncurrent_days = 30
    storage_class   = "STANDARD_IA"
  }
}