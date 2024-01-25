module "public_subnets" {
  source = "../subnet"
  for_each = var.collection
  availability_zone = "${each.key}"
  cidr_block = "${each.value}"
  vpc_id = var.vpc_id
  tags = {
    "Name" = "${var.name} public ${each.key}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = {
    "Name" = "${var.name} Internet Gateway"
  }
}

resource "aws_eip" "nat_gateway" {
  vpc = true

  tags = {
    Name = "${var.name} elastic ip nat gateway"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id = module.public_subnets["eu-central-1a"].subnet_id
  tags = {
    Name = "${var.name} NAT Gateway"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  lifecycle {
    ignore_changes = all
  }

  tags = {
    "Name" = "${var.name} public Route Table"
  }
}

module "route_table_association" {
  source = "../route_table_association"
  for_each = module.public_subnets
  route_table_id = aws_route_table.public_route_table.id
  subnet_id = each.value.subnet_id
}
