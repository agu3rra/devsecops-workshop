# Creates the CLI app in Azure
resource "azuread_application" "mbtcli" {
  display_name     = "My Blob Tool for Azure"
}

# Creates a service principal (service account) for the CLI
resource "azuread_service_principal" "mbtsp" {
  client_id                    = azuread_application.mbtcli.client_id
  app_role_assignment_required = false
}

# Generates a client secret in Azure
resource "azuread_service_principal_password" "mbtsecret" {
  service_principal_id = azuread_service_principal.mbtsp.id
  end_date             = "2024-03-01T00:00:00Z"
}

# # Grants de account read access to our blob
# resource "azurerm_role_assignment" "mbtclistoacc" {
#   scope                = azurerm_storage_account.logs_storage_account.id
#   role_definition_name = "Storage Blob Data Reader"
#   principal_id         = azuread_service_principal.mbtsp.object_id
# }
