terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "subnets" {
  for_each = var.subnets

  vpc_id = aws_vpc.vpc.id
  availability_zone = var.availability_zone
  
  cidr_block = each.value
  tags = {
      Name = each.key
  }
}

resource "aws_lambda_function" "name" {
  
}