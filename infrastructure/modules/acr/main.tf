resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                = "Basic"
  admin_enabled      = true

  tags = {
    Environment = "Development"
  }
}

# Attacher l'ACR au cluster AKS
# resource "azurerm_role_assignment" "aks_acr" {
#   principal_id                     = var.aks_principal_id
#   role_definition_name             = "AcrPull"
#   scope                           = azurerm_container_registry.acr.id
#   skip_service_principal_aad_check = true
# }
