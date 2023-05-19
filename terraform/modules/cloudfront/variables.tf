# ---------------------------------------------------------------------------
# Amazon Cloudfront variables
# ---------------------------------------------------------------------------

variable "website_bucket_regional_domain_name" {
  description = "Domain name of the S3 bucket"
  type        = string
}

variable "s3_bucket_id" {
  description = "target domain name of the S3 bucket"
  type        = string
}