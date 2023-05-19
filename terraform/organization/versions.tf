terraform {
  required_version = "~> 1.4.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.23.0"
    }
  }
}

provider "aws" {
  # alias  = "aws"
  region = local.region
  shared_credentials_files = ["./credentials"]

  default_tags {
    tags = {
      author     = "Grupo 6"
      university = "ITBA"
      subject    = "Cloud Computing"
    }
  }
}
