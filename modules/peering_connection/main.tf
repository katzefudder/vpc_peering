data "aws_caller_identity" "current" {}

# TODO: add aws_vpc_peering_connection_options

resource "aws_vpc_peering_connection" "peering_connection" {
  peer_owner_id = data.aws_caller_identity.current.account_id
  peer_vpc_id   = var.collection.vpc_id[1]
  vpc_id        = var.internal_services_vpc_id
  auto_accept   = true

  tags = {
    Name     = "${var.name} VPC Peering Internal Services"
  }
}

# attach private subnet of internal-services to internal services peering route table
resource "aws_route" "internal_services_route" {
  route_table_id            = var.internal_services_route_table_id
  destination_cidr_block    = var.collection.cidr_block.1
  vpc_peering_connection_id = aws_vpc_peering_connection.peering_connection.id
}

# attach private subnets of a customer to remote peering route table
resource "aws_route" "remote_route" {
  route_table_id            = var.collection.private_route_table_id
  destination_cidr_block    = var.internal_services_vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering_connection.id
}

module "add-subnets-to-remote-route-table" {
  source = "../mass_route_table_association"
  subnets = values(var.collection.private_subnet)
  route_table_id = var.collection.private_route_table_id
}

module "add-subnets-to-internal-services-route-table" {
  source = "../mass_route_table_association"
  subnets = values(var.internal_services_private_subnet)
  route_table_id = var.internal_services_route_table_id
}