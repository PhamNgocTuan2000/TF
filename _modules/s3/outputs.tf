# _modules/s3/outputs.tf
output "bucket_id" {
  description = "phamngoctuan-tfstate"
  value       = aws_s3_bucket.app_bucket.id
}

output "bucket_arn" {
  description = "arn:aws:s3:::phamngoctuan-tfstate"
  value       = aws_s3_bucket.app_bucket.arn
}

output "bucket_domain_name" {
  description = "The bucket domain name"
  value       = aws_s3_bucket.app_bucket.bucket_domain_name
}