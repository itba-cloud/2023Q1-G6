# ---------------------------------------------------------------------------
# VPC locals
# ---------------------------------------------------------------------------

locals {
  # public_cidr = cidrsubnet(aws_vpc.this.cidr_block, 0, 1)
  public_cidr = aws_vpc.this.cidr_block
}
