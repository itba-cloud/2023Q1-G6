module "acm" {
  source      = "../modules/acm"
  domain_name = local.s3.website.domain_name
}