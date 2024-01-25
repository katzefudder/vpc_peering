provider "aws" {
  region = var.region
}

module "internal-services" {
  for_each   = var.internal-services
  collection = var.internal-services[each.key]
  source     = "./modules/vpc"
  name       = each.key
}

module "customers" {
  depends_on = [module.internal-services]
  for_each   = var.customers
  collection = var.customers[each.key]
  source     = "./modules/vpc"
  name       = each.key
}

# peer each and every customers with internal services by default
# create "peering connections" with two route tables each
module "peer-customers-to-internal-services" {
  source                           = "./modules/peering_connection"
  for_each                         = module.customers
  collection                       = module.customers[each.key]
  name                             = each.key
  internal_services_vpc_id         = module.internal-services["internal-services"].vpc_id.1
  internal_services_route_table_id = module.internal-services["internal-services"].private_route_table_id
  internal_services_vpc_cidr_block = module.internal-services["internal-services"].cidr_block.1
  internal_services_private_subnet = module.internal-services["internal-services"].private_subnet
}