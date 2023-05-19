locals {

  # AWS VPC Configuration
  aws_vpc_network = "10.0.0.0/16"
  aws_az_count    = 2
  region = "us-east-1"
  
  # aws_ec2_ami             = "ami-0022f774911c1d690"
  # aws_ec2_type            = "t2.micro"
  # aws_ec2_web_user_data   = "scripts/web_server_user_data.sh"

  s3 = {
    website = {
      bucket_name = "classroom"
      domain_name = "daguichi.com"
      static_resources = "./resources"

      index_document = "index.html"
      error_document = "error.html"
    }
  }
}