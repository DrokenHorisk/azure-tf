resource "azurerm_postgresql_flexible_server" "postgres" {
  name                = var.server_name
  resource_group_name = var.resource_group
  location            = "francecentral"
  version             = "13"
  zone                = "3"

  administrator_login    = var.admin_user
  administrator_password = var.admin_password

  storage_mb = 32768
  sku_name   = "GP_Standard_D2ds_v4"

  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  high_availability {
    mode = "SameZone"
    standby_availability_zone = "3"
  }

  tags = {
    Environment = "Development"
  }
}

resource "azurerm_monitor_diagnostic_setting" "postgresql_diagnostics" {
  name                       = "diag"
  target_resource_id         = azurerm_postgresql_flexible_server.postgres.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category_group = "audit"
  }

  enabled_log {
    category_group = "allLogs"
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}
#resource "azurerm_postgresql_flexible_server_database" "db" {
#  name      = var.database_name
#  server_id = azurerm_postgresql_flexible_server.postgres.id
#  charset   = "UTF8"
#  collation = "en_US.utf8"
#}
