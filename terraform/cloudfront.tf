module "cloudfront" {
  source = "./modules/cloudfront"

  domain_name        = local.web_site_domain
  s3_origin_id = "S3"
}