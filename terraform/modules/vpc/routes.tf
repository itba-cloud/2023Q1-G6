resource "aws_route_table" "private" {
  count  = var.zones_count
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "route_table_private_${count.index}"
  }
}
resource "aws_route_table_association" "functions" {
  count          = var.zones_count
  subnet_id      = aws_subnet.functions[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}

resource "aws_route_table_association" "persistance" {
  count          = var.zones_count
  subnet_id      = aws_subnet.persistance[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}
