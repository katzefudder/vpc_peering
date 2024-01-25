output "vpc_id" {
  value = merge(
    {
      for k, vpc in module.internal-services : k => vpc.vpc_id
    },
    {
      for k, vpc in module.customers : k => vpc.vpc_id
    }
  )
}

output "vpc_cidr_block" {
  value = merge(
    {
      for k, vpc in module.internal-services : k => vpc.cidr_block
    },
    {
      for k, vpc in module.customers : k => vpc.cidr_block
    }
  )
}

output "private_subnet_id" {
  value = merge(
    {
      for k, value in module.internal-services : k => value.private_subnet
    },
    {
      for k, value in module.customers : k => value.private_subnet
    }
  )
}

output "private_subnet_cidr" {
  value = merge(
    {
      for k, value in module.internal-services : k => value.private_subnet_cidr
    },
    {
      for k, value in module.customers : k => value.private_subnet_cidr
    }
  )
}

output "public_subnet_id" {
  value = merge(
    {
      for k, value in module.internal-services : k => value.public_subnet
    },
    {
      for k, value in module.customers : k => value.public_subnet
    }
  )
}

output "public_subnet_cidr" {
  value = merge(
    {
      for k, value in module.internal-services : k => value.public_subnet_cidr
    },
    {
      for k, value in module.customers : k => value.public_subnet_cidr
    }
  )
}

output "private_route_table_id" {
  value = merge(
    {
      for k, value in module.internal-services : k => value.private_route_table_id
    },
    {
      for k, value in module.customers : k => value.private_route_table_id
    }
  )
}

output "public_route_table_id" {
  value = merge(
    {
      for k, value in module.internal-services : k => value.public_route_table_id
    },
    {
      for k, value in module.customers : k => value.public_route_table_id
    }
  )
}

output "nat_gateway_id" {
  value = merge(
    {
      for k, value in module.internal-services : k => value.nat_gateway_id
    },
    {
      for k, value in module.customers : k => value.nat_gateway_id
    }
  )
}