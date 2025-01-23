output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "subnet_ids" {
  value = azurerm_subnet.subnet[*].id
}


output "private_ip_address" {
  value = azurerm_network_interface.web.private_ip_address
}

output "subnet_id" {
  value = azurerm_subnet.subnet[0].id
}

output "network_interface_id" {
  value = azurerm_network_interface.web.id
}
