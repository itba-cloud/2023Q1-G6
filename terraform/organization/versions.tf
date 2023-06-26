terraform {
  required_version = "~> 1.4.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.5.0"
    }
  }
}

provider "aws" {
  # alias  = "aws"
  region                   = local.region

  default_tags {
    tags = {
      author     = "Grupo 6"
      university = "ITBA"
      subject    = "Cloud Computing"
    }
  }
}
