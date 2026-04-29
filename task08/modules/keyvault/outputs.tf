output "key_vault_id" {
  value       = azurerm_key_vault.kv.id
  description = "Output value of the key vault id"

}

output "key_vault_name" {
  value       = azurerm_key_vault.kv.name
  description = "Output value of the key vault name"

}