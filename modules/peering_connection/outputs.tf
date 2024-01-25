output "aws_vpc_peering_connection" {
  value = aws_vpc_peering_connection.peering_connection.*.id
}

output "private_subnet" {
  value = var.collection.private_subnet
}