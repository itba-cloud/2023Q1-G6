# ---------------------------------------------------------------------------
# Amazon S3 resources
# ---------------------------------------------------------------------------

module "website" {
  source = "./modules/web-site"

  bucket_name = local.s3.website.bucket_name
  export_path = local.s3.website.path

  index_document = local.s3.website.index_document
  error_document = local.s3.website.error_document

  cloudfront_origin_access_identity = aws_cloudfront_origin_access_identity.user.iam_arn
}