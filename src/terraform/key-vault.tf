# Gets my current az cli user context when runnign terraform locally
data "azurerm_client_config" "current" {}

# Creating an user-assigned managed identity for everything
resource "azurerm_user_assigned_identity" "aksuid" {
  location            = azurerm_resource_group.rg.location
  name                = "akv-ua-id"
  resource_group_name = azurerm_resource_group.rg.name
}

# Azure Key Vault per-se
resource "azurerm_key_vault" "akv" {
  name                = "${var.prefix}-akv"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = azurerm_user_assigned_identity.aksuid.tenant_id
  sku_name            = "standard"
}

# AKV access policy to tie my current account to key vault
resource "azurerm_key_vault_access_policy" "akvpolicymyid" {
  key_vault_id = azurerm_key_vault.akv.id
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id

  key_permissions = [
    "Get", "List", "Rotate", "Create", "Delete"
  ]
  secret_permissions = [
    "Get", "List", "Set", "Purge"
  ]
}

# AKV access policy to tie user-assigned account to key vault
resource "azurerm_key_vault_access_policy" "akvpolicyuaid" {
  key_vault_id = azurerm_key_vault.akv.id
  tenant_id    = azurerm_user_assigned_identity.aksuid.tenant_id
  object_id    = azurerm_user_assigned_identity.aksuid.principal_id

  key_permissions = [
    "Get", "List", "Rotate", "Create", "Delete"
  ]
  secret_permissions = [
    "Get", "List", "Set", "Purge"
  ]
}
