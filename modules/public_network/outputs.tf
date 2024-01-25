output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gateway.id
}

output "subnet_id" {
  value = tomap({
    for k, value in module.public_subnets : k => value.subnet_id
  })
}

output "cidr_block" {
  value = tomap({
    for k, value in module.public_subnets : k => value.cidr_block
  })
}

output "route_table_id" {
  value = aws_route_table.public_route_table.id
}