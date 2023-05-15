# Cloudfront variables
variable "domain_name" {
  type = string
  description = "The domain name for the CloudFront distribution"
}

variable "s3_origin_id" {
  type = string
  description = "The S3 origin ID"
}
