output "vpc_id" {
  value = tomap({
    for k, vpc in aws_vpc.VPC : k => vpc.id
  })
}

output "cidr_block" {
  value = tomap({
    for k, vpc in aws_vpc.VPC : k => vpc.cidr_block
  })
}

output "private_subnet" {
  value = tomap({
    for k, value in module.private_network.subnet_id : k => value
  })
}

output "private_subnet_cidr" {
  value = tomap({
    for k, value in module.private_network.cidr_block : k => value
  })
}

## public subnets
output "public_subnet" {
  value = tomap({
    for k, value in module.public_network.subnet_id : k => value
  })
}

output "public_subnet_cidr" {
  value = tomap({
    for k, value in module.public_network.cidr_block : k => value
  })
}

output "public_route_table_id" {
  value = module.public_network.route_table_id
}

output "private_route_table_id" {
  value = module.private_network.route_table_id
}

output "nat_gateway_id" {
  value = module.public_network.nat_gateway_id
}