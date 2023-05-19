module "rds" {
  source = "./modules/rds"

  zones_count = local.aws_az_count
  aws_region = local.region
  vpc_cidr = local.aws_vpc_network
  vpc_id = module.vpc.vpc_id
  vpc_subnet_ids = module.vpc.persistance_subnets_ids
}