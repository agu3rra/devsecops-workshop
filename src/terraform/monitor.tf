# resource "azurerm_log_analytics_workspace" "loganaws" {
#     name = "${var.prefix}-loganaws"
#     resource_group_name = azurerm_resource_group.rg.name
#     location = azurerm_resource_group.rg.location
#     sku = "Free"
#     retention_in_days = 7
# }

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