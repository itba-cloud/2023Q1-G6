module "cloudfront" {
  source = "./modules/cloudfront"

  s3_bucket_id = module.website.s3_bucket_id
  website_bucket_regional_domain_name= module.website.website_bucket_regional_domain_name
  aliases = ["www.${var.web_site_domain}", var.web_site_domain]
  certificate_arn = module.acm.certificate_arn
}