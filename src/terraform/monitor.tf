resource "azurerm_log_analytics_workspace" "loganws" {
    name = "${var.prefix}-loganws"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    sku = "Standalone"
    retention_in_days = 30
}

resource "azurerm_virtual_machine_extension" "ama" {
  name                 = "AzureMonitorAgent"
  virtual_machine_id   = azurerm_linux_virtual_machine.mylinux.id
  publisher            = "Microsoft.Azure.Monitor"
  type                 = "AzureMonitorLinuxAgent"
  type_handler_version = "1.0"

  settings = <<SETTINGS
  {
    "workspaceId": "${azurerm_log_analytics_workspace.loganws.workspace_id}"
  }
  SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
  {
    "workspaceKey": "${azurerm_log_analytics_workspace.loganws.primary_shared_key}"
  }
  PROTECTED_SETTINGS
}


# resource "azurerm_monitor_diagnostic_setting" "monitorsettings" {
#     name = "monitorsettings"
#     target_resource_id = azurerm_linux_virtual_machine.mylinux.id
#     storage_account_id = azurerm_storage_account.logs_storage_account.id

#     log {
#         category = "AuditLogs"
#         enabled = true

#         retention_policy {
#           days = 0
#           enabled = false
#         }
#     }
# }