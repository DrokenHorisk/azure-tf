variable "resource_group_name" {
  description = "Nom du groupe de ressources"
  default     = "myResourceGroup"
}

variable "location" {
  description = "Emplacement de l'infrastructure"
  default     = "France South"
}

variable "aks_cluster_name" {
  description = "Nom du cluster AKS"
  default     = "myAKSCluster"
}
