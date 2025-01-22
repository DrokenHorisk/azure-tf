provider "azurerm" {
  features {}

  subscription_id = "0c7369f8-4025-4bac-9364-218d5e931143"
  tenant_id       = "b7b023b8-7c32-4c02-92a6-c8cdaa1d189c"
}

# Création d'un groupe de ressources
resource "azurerm_resource_group" "rg" {
  name     = "myResourceGroup"
  location = "East US"
}

# Création d'un cluster AKS (Kubernetes)
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "myAKSCluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "myakscluster"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  depends_on = [azurerm_resource_group.rg]
}

# Azure Container Registry (ACR) pour stocker les images Docker
resource "azurerm_container_registry" "acr" {
  name                = "myacr${random_string.suffix.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}

# Azure MSSQL Server
resource "azurerm_mssql_server" "mssql_server" {
  name                         = "mymssqlserver${random_string.suffix.result}"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = "eastus"
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "Password123!"
  minimum_tls_version          = "1.2"
}


# Azure MSSQL Database
resource "azurerm_mssql_server" "mssql_server" {
  name                         = "tf_azure_sql_dev_${random_string.suffix.result}"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = "eastus"  # Remplace par la région valide
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "Password123!"
  minimum_tls_version          = "1.2"
}

resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}
