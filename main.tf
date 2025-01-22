provider "azurerm" {
  features {}

  subscription_id = "0c7369f8-4025-4bac-9364-218d5e931143"
  tenant_id       = "b7b023b8-7c32-4c02-92a6-c8cdaa1d189c"
}

# Création d'un groupe de ressources dans France Central
resource "azurerm_resource_group" "rg" {
  name     = "myResourceGroup"
  location = "West Europe"
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

  depends_on = [azurerm_resource_group.rg]
}

# Azure MSSQL Server
resource "azurerm_mssql_server" "mssql_server_dev" {
  name                         = "tfazuresqldev${random_string.suffix.result}"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = "francecentral"
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "Password123!"
  minimum_tls_version          = "1.2"
}

# Azure MSSQL Database
resource "azurerm_mssql_database" "mssql_db" {
  name      = "mymssqldatabase"
  server_id = azurerm_mssql_server.mssql_server_dev.id
  sku_name  = "Basic"
}

# Génération d'un suffixe unique pour garantir des noms uniques
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

# Création d'une machine virtuelle avec Apache installé
resource "azurerm_public_ip" "web_ip" {
  name                = "webserver-public-ip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# Création du réseau virtuel et du sous-réseau
resource "azurerm_virtual_network" "web_vnet" {
  name                = "webserver-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "web_subnet" {
  name                 = "webserver-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.web_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Création d'une interface réseau pour la VM
resource "azurerm_network_interface" "web" {
  name                = "webserver-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "webserver-ip-config"
    subnet_id                     = azurerm_subnet.web_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.web_ip.id
  }

  depends_on = [azurerm_subnet.web_subnet]
}

# Création de la machine virtuelle
resource "azurerm_virtual_machine" "web" {
  name                  = "webserver"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.web.id]
  vm_size               = "Standard_B1s"

  os_profile {
    computer_name  = "webserver"
    admin_username = "adminuser"
    admin_password = "Password123!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  storage_os_disk {
    name              = "webserver-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y apache2",
      "sudo systemctl start apache2",
      "sudo systemctl enable apache2"
    ]
  }

  depends_on = [azurerm_network_interface.web]
}
