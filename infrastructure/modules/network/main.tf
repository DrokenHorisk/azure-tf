resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space

  tags = {
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}

# Attendez que le vnet soit créé avant de créer les subnets
resource "azurerm_subnet" "subnet" {
  count                = length(var.subnet_prefixes)
  name                 = var.subnet_names[count.index]
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_prefixes[count.index]]
}

resource "azurerm_network_interface" "web" {
  name                = "webserver-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "webserver-ip-config"
    subnet_id = azurerm_subnet.subnet[0].id
    private_ip_address_allocation = "Dynamic"
    network_interface_id = module.network.nic_id  # Ajuster selon l'output correct

  }
}
