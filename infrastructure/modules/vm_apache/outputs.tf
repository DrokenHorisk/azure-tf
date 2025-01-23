output "vm_id" {
  value = azurerm_virtual_machine.web.id
}

output "vm_public_ip" {
  value = var.private_ip_address
}

output "vm_private_ip" {
  value = azurerm_network_interface.web.private_ip_address
}


output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
}
