locals {

  # AWS VPC Configuration
  aws_vpc_network = "10.0.0.0/16"
  aws_az_count    = 2
  region =      var.aws_region
  
  # aws_ec2_ami             = "ami-0022f774911c1d690"
  # aws_ec2_type            = "t2.micro"
  # aws_ec2_web_user_data   = "scripts/web_server_user_data.sh"

  # static_resources = "resources"

  s3 = {
    web-site = {
      bucket_name = "example123"
      path        = "./resources/web-site"

      index_document = "index.html"
      error_document = "error.html"
    }
  }
}