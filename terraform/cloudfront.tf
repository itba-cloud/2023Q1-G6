module "cloudfront" {
  source = "./modules/cloudfront"

  # domain_name        = local.web_site_domain
  # s3_origin_id = "S3"

  website_bucket_regional_domain_name= module.website.website_bucket_regional_domain_name
}