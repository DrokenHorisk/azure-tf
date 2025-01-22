variable "resource_group_name" {
  description = "Nom du groupe de ressources"
  default     = "myResourceGroup"
}

variable "location" {
  description = "Emplacement de l'infrastructure"
  default     = "East US"
}

variable "aks_cluster_name" {
  description = "Nom du cluster AKS"
  default     = "myAKSCluster"
}
