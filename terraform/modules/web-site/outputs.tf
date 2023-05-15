output "redirect_bucket_endpoint" {
  value = aws_s3_bucket.redirect.website_endpoint
}

output "website_bucket_endpoint" {
  value = aws_s3_bucket.website.website_endpoint
}

output "log_bucket_endpoint" {
  value = aws_s3_bucket.log.website_endpoint
}