output "server_id" {
  value = azurerm_postgresql_flexible_server.postgres.id
}

output "server_name" {
  value = azurerm_postgresql_flexible_server.postgres.name
}

#output "database_name" {
#  value = azurerm_postgresql_flexible_server_database.db.name
#}

#output "server_fqdn" {
##  value = azurerm_postgresql_flexible_server.postgres.fqdn
#}
