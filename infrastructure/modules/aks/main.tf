resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name                = "default"
    node_count          = var.node_count
    vm_size            = "Standard_D2s_v3"
    os_disk_size_gb    = 30
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin     = "azure"
    load_balancer_sku = "standard"
  }

  monitor_metrics {
    annotations_allowed = "*"
    labels_allowed     = "*"
  }

  tags = {
    Environment = "Development"
  }
}
