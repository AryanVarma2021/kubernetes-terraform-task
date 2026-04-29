variable "kv_name" {
    description = "Name of the Key Vault"
    type        = string
  
}

variable "resource_group" {
    description = "Name of the Resource Group"
    type        = string
  
}

variable "location" {
    description = "Azure Region for the Key Vault"
    type        = string
  
}

variable "sku_name" {
    description = "SKU of the Key Vault (e.g., standard, premium)"
    type        = string
  
}



variable "tags" {
    description = "Tags to apply to the Key Vault"
    type        = map(string)
  
}
