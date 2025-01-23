variable "cluster_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "dns_prefix" {
  type = string
}

variable "node_count" {
  type    = number
  default = 1
}

variable "kubernetes_version" {
  type    = string
  default = "1.26.6"
}

variable "log_analytics_workspace_id" {
  type = string
}
