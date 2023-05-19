# ---------------------------------------------------------------------------
# Amazon Cloudfront outputs
# ---------------------------------------------------------------------------

output "cloudfront_distribution" {
  description = "The cloudfront distribution for the deployment"
  value       = aws_cloudfront_distribution.this
}

output "web_site_OAI" {
    description = "OAI used for website"
    value = aws_cloudfront_origin_access_identity.oai.iam_arn
}