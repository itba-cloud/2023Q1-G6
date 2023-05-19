# ---------------------------------------------------------------------------
# Amazon S3 resources
# ---------------------------------------------------------------------------

module "website" {
  source = "./modules/web-site"

  bucket_name = local.s3.website.bucket_name

  domain_name = format("%s%s","www.", local.s3.website.domain_name)
  redirect_domain_name = local.s3.website.domain_name
  bucket_access_oai = [module.cloudfront.web_site_OAI]

  index_document = local.s3.website.index_document
  error_document = local.s3.website.error_document
}