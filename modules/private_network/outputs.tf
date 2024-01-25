output "subnet_id" {
  value = tomap({
    for k, value in module.private_subnets : k => value.subnet_id
  })
}

output "cidr_block" {
  value = tomap({
    for k, value in module.private_subnets : k => value.cidr_block
  })
}

output "route_table_id" {
  value = aws_route_table.private_route_table.id
}