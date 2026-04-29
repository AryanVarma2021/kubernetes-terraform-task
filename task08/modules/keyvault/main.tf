data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {

  name                = var.kv_name
  resource_group_name = var.resource_group
  location            = var.location
  sku_name            = var.sku_name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  tags = var.tags


}


resource "azurerm_key_vault_access_policy" "policy" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = data.auzrerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.object_id

  secret_permissions = [
    "Get",
    "List",
    "Set"
  ]


}