resource "azurerm_log_analytics_workspace" "law" {
  name                = var.workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"  # SKU le plus courant
  retention_in_days   = 30  # Rétention minimale de 30 jours

  tags = {
    Environment = "Development"
  }
}
