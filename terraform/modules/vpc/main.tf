# ---------------------------------------------------------------------------
# VPC
# ---------------------------------------------------------------------------

resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "functions" {
  count             = var.zones_count
  cidr_block        = cidrsubnet(local.public_cidr, 8, count.index)
  vpc_id            = aws_vpc.this.id
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "subnet_functions_${count.index}"
  }

  depends_on = [aws_vpc.this, data.aws_availability_zones.available]
}

resource "aws_subnet" "persistance" {
  count             = var.zones_count
  cidr_block        = cidrsubnet(local.public_cidr, 8, count.index + length(aws_subnet.functions))
  vpc_id            = aws_vpc.this.id
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "subnet_persistance_${count.index}"
  }

  depends_on = [aws_vpc.this, data.aws_availability_zones.available, aws_subnet.functions]
}
