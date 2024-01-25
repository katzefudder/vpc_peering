module "private_subnets" {
  source = "../subnet"
  for_each = var.collection
  availability_zone = "${each.key}"
  cidr_block = "${each.value}"
  vpc_id = var.vpc_id
  tags = {
    "Name" = "${var.name} private ${each.key}"
  }
}

# create a route table with a route to the internet, hence private machines can reach out but not be reached from the outside
resource "aws_route_table" "private_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_id
  }

  lifecycle {
    ignore_changes = all
  }

  tags = {
    "Name" = "${var.name} private Route Table"
  }
}

# assign each and every subnet created within this module to the private route table
module "route_table_association" {
  source = "../route_table_association"
  for_each = module.private_subnets
  route_table_id = aws_route_table.private_route_table.id
  subnet_id = each.value.subnet_id
}
