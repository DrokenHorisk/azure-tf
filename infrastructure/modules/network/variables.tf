variable "vnet_name" {
  description = "Nom du réseau virtuel"
  type        = string
}

variable "location" {
  description = "Emplacement Azure"
  type        = string
}

variable "resource_group_name" {
  description = "Nom du groupe de ressources"
  type        = string
}

variable "address_space" {
  description = "Plage d'adresses du réseau"
  type        = list(string)
}

variable "subnet_name" {
  description = "Nom du sous-réseau"
  type        = string
}

variable "subnet_prefixes" {
  description = "Plages d'adresses du sous-réseau"
  type        = list(string)
}
