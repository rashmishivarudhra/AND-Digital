variable "s3_bucket" {
  description = "S3 bucket name for terraform state"
  type        = string
  default     = "and-s3-backend"
}

variable "s3_bucket_name" {
  description = "'Name' tag for S3 bucket with terraform state."
  type        = string
  default     = "and_statefile_bucket"
}