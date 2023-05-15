output "vpc_id" {
  value = aws_vpc.this.id
}

output "vpc_cidr" {
  value = aws_vpc.this.cidr_block
}

output "functions_subnets_ids" {
  value = [
    for k, v in aws_subnet.functions : v.id
  ]
}

output "persistance_subnets_ids" {
  value = [
    for k, v in aws_subnet.persistance : v.id
  ]
}
