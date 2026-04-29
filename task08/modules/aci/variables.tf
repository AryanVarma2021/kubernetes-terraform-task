variable "azure_conatiner_instance_name" {
  description = "Name of the Azure Container Instance"
  type        = string

}


variable "sku_name" {
  description = "The SKU of the Azure Container Instance"
  type        = string

}
variable "resource_group" {
  description = "The name of the resource group in which to create the Azure Container Instance"
  type        = string

}

variable "location" {
  description = "The Azure region where the Azure Container Instance will be created"
  type        = string

}





variable "dns_name_label" {
  description = "The DNS name label for the Azure Container Instance"
  type        = string

}

variable "container_conf" {

  description = "A list of container configurations for the Azure Container Instance"
  type = list(object({
    name                         = string
    image                        = string
    cpu                          = number
    memory                       = number
    port                         = number
    environment_variables        = map(string)
    secure_environment_variables = map(string)
  }))

}

variable "image_registry_server" {
  description = "The server of the container image registry (e.g., Docker Hub or Azure Container Registry)"
  type        = string

}

variable "image_registry_username" {
  description = "The username for authenticating with the container image registry"
  type        = string

}

variable "image_resgistry_password" {
  description = "The password for authenticating with the container image registry"
  type        = string
  sensitive   = true

}

variable "tags" {
  description = "A map of tags to be applied to the Azure Container Instance"
  type        = map(string)

}