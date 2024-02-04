# Resource Azure Blob Storage
resource "azurerm_storage_account" "logs_storage_account" {
  name = "${var.prefix}logsaccount"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  account_tier = "Standard"
  account_replication_type = "LRS"
  account_kind = "BlobStorage"
  allow_nested_items_to_be_public = false
  identity {
    type = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aksuid.id]
  }
}
resource "azurerm_storage_container" "logs_storage_container" {
  name = "${var.prefix}logscontainer"
  storage_account_name = azurerm_storage_account.logs_storage_account.name
  container_access_type = "private"
}

resource "azurerm_role_assignment" "uatosto" {
  scope                = azurerm_storage_account.logs_storage_account.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_user_assigned_identity.aksuid.principal_id
}
