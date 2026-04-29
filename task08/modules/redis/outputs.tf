output "redis_host_name" {

  value = azurerm_redis_cache.redis.hostname

}

output "redis_key" {

  value = azurerm_redis_cache.redis.primary_access_key

}