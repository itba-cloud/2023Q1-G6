locals {
  db_name   = "postgresql-db"
  region = var.aws_region

#   vpc_cidr = "10.0.0.0/16"
#   azs      = slice(data.aws_availability_zones.available.names, 0, 3)

#   tags = {
#     Name       = local.name
#     Example    = local.name
#     Repository = "https://github.com/terraform-aws-modules/terraform-aws-rds"
#   }
db_user= "${local.db_name}-user"
db_password="placeholderpasswd"
  engine                = "postgres"
  engine_version        = "14.7"
  family                = "postgres14" # DB parameter group
  major_engine_version  = "14"         # DB option group
  instance_class        = "db.t3.micro"
  allocated_storage     = 20
  max_allocated_storage = 100
  db_port                  = 5432
}