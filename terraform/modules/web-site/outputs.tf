# --------------------------------------------------------------------
# Amazon S3 outputs
# --------------------------------------------------------------------

output "s3_bucket_id" {
  description = "bucket id"
  value       = aws_s3_bucket.redirect.id
}

# output "redirect_bucket_endpoint" {
#   value = aws_s3_bucket.redirect.website_endpoint
# }

# output "website_bucket_endpoint" {
#   value = aws_s3_bucket.website.website_endpoint
# }

# output "log_bucket_endpoint" {
#   value = aws_s3_bucket.log.website_endpoint
# }

output "website_bucket_regional_domain_name" {
  value = aws_s3_bucket.website.bucket_regional_domain_name
}

output "website_bucket_redirect_ip" {
  value = aws_s3_bucket.redirect.hosted_zone_id
}