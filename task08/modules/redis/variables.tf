variable "redis_name" {
  description = "Name of the Redis Cache"
  type        = string

}

variable "resource_group" {
  description = "Name of the resource group"
  type        = string

}

variable "location" {
  description = "Azure region for the Redis Cache"
  type        = string

}

variable "capacity" {
  description = "The size of the Redis Cache. Valid values are 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, and 15."
  type        = number

}

variable "family" {
  description = "The family of the Redis Cache. Valid values are C and P."
  type        = string

}

variable "sku_name" {
  description = "The SKU of the Redis Cache. Valid values are Basic, Standard, and Premium."
  type        = string

}

variable "redis_hostname" {
  description = "Name of the Redis Cache hostname secret in Key Vault"
  type        = string

}

variable "redis_primary_key" {
  description = "Name of the Redis Cache primary key secret in Key Vault"
  type        = string

}

variable "tags" {
  description = "Tags to be applied to the Redis Cache"
  type        = map(string)

}

variable "keyvault_id" {
  description = "ID of the Key Vault where Redis Cache secrets will be stored"
  type        = string

}