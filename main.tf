module "resource_group" {
  source   = "./infrastructure/modules/resource_group"
  rg_name  = var.resource_group_name
  location = var.location
}

module "network" {
  source              = "./infrastructure/modules/network"
  vnet_name           = var.vnet_name
  resource_group_name = module.resource_group.name
}
