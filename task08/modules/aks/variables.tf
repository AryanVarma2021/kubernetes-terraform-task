variable "aks_name" {
  description = "Name of the AKS cluster"
  type        = string

}

variable "resource_group" {
  description = "Name of the resource group where the AKS cluster will be created"
  type        = string

}

variable "location" {
  description = "Azure region where the AKS cluster will be created"
  type        = string

}

variable "default_node_pool_name" {
  description = "Name of the default node pool for the AKS cluster"
  type        = string
  default     = "system"

}

variable "default_node_pool_count" {
  description = "Number of nodes in the default node pool"
  type        = number
  default     = 1

}

variable "default_node_pool_vm_size" {
  description = "VM size for the nodes in the default node pool"
  type        = string
  default     = "Standard_D2ads_v6"

}

variable "acr_id" {
  description = "ID of the Azure Container Registry (ACR) to which the AKS cluster will be granted pull access"
  type        = string

}

variable "key_vault_id" {
  description = "ID of the Azure Key Vault to which the AKS cluster will be granted access"
  type        = string

}

variable "tenant_id" {
  description = "Tenant ID of the Azure Active Directory"
  type        = string

}

variable "tags" {
  description = "Tags to be applied to the AKS cluster"
  type        = map(string)


}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string

}