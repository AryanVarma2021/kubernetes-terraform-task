variable "name_prefix" {
  description = "Prefix for the name of the Azure Container Instance"
  type        = string

}

variable "tags" {
  description = "Tags to be applied to the Azure Container Instance"
  type        = map(string)


}

variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string

}

variable "acr_sku" {
  description = "SKU of the Azure Container Registry (e.g., Basic, Standard, Premium)"
  type        = string

}

variable "git_pat" {
  description = "Personal Access Token for accessing the Git repository"
  type        = string
  sensitive   = true

}

variable "repo_url" {
  description = "URL of the Git repository containing the application code"
  type        = string

}

variable "aci_sku_name" {
  description = "SKU name for the Azure Container Instance (e.g., Standard, Premium)"
  type        = string

}

variable "key_vault_sku" {
  description = "SKU of the Azure Key Vault (e.g., Standard, Premium)"
  type        = string

}

variable "redis_hostname" {
  description = "Name of the secret in Azure Key Vault to store the Redis hostname"
  type        = string

}

variable "redis_primary_key" {
  description = "Name of the secret in Azure Key Vault to store the Redis primary access key"
  type        = string

}

variable "capacity" {
  description = "The capacity of the Azure Redis Cache (e.g., 0 for Basic, 1 for Standard, 2 for Premium)"
  type        = number

}

variable "family" {
  description = "The family of the Azure Redis Cache (e.g., C for Basic, P for Standard and Premium)"
  type        = string

}

variable "redis_sku_name" {
  description = "The SKU name for the Azure Redis Cache (e.g., Basic, Standard, Premium)"
  type        = string

}

