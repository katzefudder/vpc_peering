variable "collection" {}
variable "name" {
  type = string
}

variable "internal_services_vpc_cidr_block" {}
variable "internal_services_private_subnet" {}
variable "internal_services_route_table_id" {}
variable "internal_services_vpc_id" {}