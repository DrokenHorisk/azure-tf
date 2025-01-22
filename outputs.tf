output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "container_registry_login" {
  value = azurerm_container_registry.acr.login_server
}

output "sql_server_fqdn" {
  value = azurerm_mssql_server.mssql_server.fully_qualified_domain_name
}
