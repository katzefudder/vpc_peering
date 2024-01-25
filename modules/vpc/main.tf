resource "aws_vpc" "VPC" {
  for_each = var.collection.vpc_cidr_block
  cidr_block       = each.value
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "${var.name} VPC"
  }
}

module "public_network" {
  source = "../public_network"
  collection = var.collection.public
  vpc_id = aws_vpc.VPC[1].id
  name = var.name
}

module "private_network" {
  source = "../private_network"
  collection = var.collection.private
  vpc_id = aws_vpc.VPC[1].id
  nat_gateway_id = module.public_network.nat_gateway_id
  name = var.name
}