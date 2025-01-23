variable "vnet_name" {
  type        = string
  description = "Virtual Network Name"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}

variable "location" {
  type        = string
  description = "Azure Region"
}

variable "address_space" {
  type        = list(string)
  description = "Address space for Virtual Network"
  default     = ["10.0.0.0/16"]
}

variable "subnet_names" {
  description = "List of subnet names"
  type        = list(string)
}

variable "subnet_prefixes" {
  description = "List of subnet CIDR prefixes"
  type        = list(string)
}
