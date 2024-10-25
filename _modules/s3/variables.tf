# _modules/s3/variables.tf
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "environment" {
  description = "Environment (dev/staging/prod)"
  type        = string
}

variable "tags" {
  description = "Additional tags for the S3 bucket"
  type        = map(string)
  default     = {}
}