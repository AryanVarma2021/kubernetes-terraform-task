variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string

}

variable "resource_group_name" {
  description = "Name of the Resource Group where the ACR will be created"
  type        = string

}

variable "acr_sku" {
  description = "SKU of the Azure Container Registry (e.g., Basic, Standard, Premium)"
  type        = string

}

variable "location" {
  description = "Azure region where the ACR will be created"
  type        = string

}

variable "repo_url" {
  description = "URL of the Git repository containing the Dockerfile and application code"
  type        = string

}



variable "git_pat" {
  description = "Personal Access Token for accessing the Git repository"
  type        = string
  sensitive   = true

}

variable "image_name" {
  description = "Name of the container image to be built and pushed to ACR (e.g., myapp:latest)"
  type        = string

}