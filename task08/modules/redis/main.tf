resource "azurerm_redis_cache" "redis" {

  name                = var.redis_name
  resource_group_name = var.resource_group
  location            = var.location
  capacity            = var.capacity
  family              = var.family
  sku_name            = var.sku_name

  tags = var.tags

}


resource "azurerm_key_vault_secret" "redis-hostname" {
  key_vault_id = var.keyvault_id

  name = var.redis_hostname

  value = azurerm_redis_cache.redis.hostname

}


resource "azurerm_key_vault_secret" "redis-primary-key" {
  key_vault_id = var.keyvault_id

  name = var.redis_primary_key

  value = azurerm_redis_cache.redis.primary_access_key


}