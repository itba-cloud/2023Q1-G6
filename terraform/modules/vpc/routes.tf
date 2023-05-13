###
## Private
###
resource "aws_route_table" "public" {
  count  = var.zones_count
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "public_${count.index}"
  }
}

resource "aws_route_table" "private" {
  count  = var.zones_count
  vpc_id = aws_vpc.this.id

  # route {
  #   cidr_block = "0.0.0.0/0"
  #   gateway_id = aws_internet_gateway.this.id
  # }

  tags = {
    Name = "private_${count.index}"
  }
}

resource "aws_route_table_association" "public" {
  count          = var.zones_count
  subnet_id      = aws_subnet.presentation[count.index].id
  route_table_id = aws_route_table.public[count.index].id
}

resource "aws_route_table_association" "private" {
  count          = var.zones_count
  subnet_id      = aws_subnet.back_end[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}