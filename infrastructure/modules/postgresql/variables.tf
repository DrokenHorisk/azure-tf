variable "server_name" {
  type        = string
  description = "Name of the PostgreSQL server"
}

variable "database_name" {
  type        = string
  description = "Name of the PostgreSQL database"
}

variable "resource_group" {
  type        = string
  description = "Name of the resource group"
}

variable "admin_user" {
  type        = string
  description = "PostgreSQL admin username"
}

variable "admin_password" {
  type        = string
  description = "PostgreSQL admin password"
  sensitive   = true
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "ID of the Log Analytics Workspace for diagnostics"
}
