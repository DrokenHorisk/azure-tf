output "vm_id" {
  value = azurerm_virtual_machine.web.id
}

output "vm_public_ip" {
  value = azurerm_network_interface.web.private_ip_address
}
