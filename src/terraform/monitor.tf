resource "azurerm_log_analytics_workspace" "loganws" {
    name                = "${var.prefix}-loganws"
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    sku                 = "PerGB2018"
    retention_in_days   = 30
}

resource "azurerm_virtual_machine_extension" "ama" {
  name                 = "AzureMonitorLinuxAgent"
  virtual_machine_id   = azurerm_linux_virtual_machine.mylinux.id
  publisher            = "Microsoft.Azure.Monitor"
  type                 = "AzureMonitorLinuxAgent"
  type_handler_version = "1.29"

  settings = <<SETTINGS
  {
      "workspaceId": "${azurerm_log_analytics_workspace.loganws.workspace_id}",
      "workspaceKey": "${azurerm_log_analytics_workspace.loganws.primary_shared_key}",
      "authentication": {
        "managedIdentity": {
          "identifier-type": "mi_res_id",
          "identifier-name": "mi_res_id",
          "identifier-value": "${azurerm_user_assigned_identity.aksuid.name}"
        }
      }
  }
  SETTINGS
}

resource "azurerm_monitor_data_collection_endpoint" "linuxdcendpoint" {
  name                          = "linuxvm-data-collection-endpoint"
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = azurerm_resource_group.rg.location
  kind                          = "Linux"
  public_network_access_enabled = true
  description                   = "Collection endpoint for our first VM"
}

resource "azurerm_monitor_data_collection_rule" "logcollectionrule1" {
  name = "linuxvm-collection-rule1"
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = azurerm_resource_group.rg.location
  data_collection_endpoint_id   = azurerm_monitor_data_collection_endpoint.linuxdcendpoint.id
  kind                          = "Linux"
  identity {
    type = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aksuid.id]
  }

  destinations {
    log_analytics {
      workspace_resource_id = azurerm_log_analytics_workspace.loganws.id
      name                  = "destination-log-ws-analytics"
    }

    storage_blob {
      name               = "destination-storage-blob"
      storage_account_id = azurerm_storage_account.logs_storage_account.id
      container_name     = azurerm_storage_container.logs_storage_container.name
    }
  }

  # additional info and values at https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_data_collection_rule#syslog
  data_sources {
    syslog {
      name           = "linux-vm-syslog"
      facility_names = [
        "alert",
        "audit",
        "auth",
        "authpriv",
        "clock",
        "cron",
        "daemon",
        "ftp",
        "kern",
        "local0",
        "local1",
        "local2",
        "local3",
        "local4",
        "local5",
        "local6",
        "local7",
        "lpr",
        "mail",
        "news",
        "nopri",
        "ntp",
        "syslog",
        "user",
        "uucp"
      ]
      log_levels     = [
        "Debug",
        "Info",
        "Notice",
        "Warning",
        "Error",
        "Critical",
        "Alert",
        "Emergency"
      ]
      streams        = ["Microsoft-Syslog"]
    }
  }

  data_flow {
    streams = ["Microsoft-Syslog"]
    destinations = [
      "destination-log-ws-analytics",
      "destination-storage-blob"
    ]
  }

}

# associate to a Data Collection Rule
resource "azurerm_monitor_data_collection_rule_association" "datacolvm1" {
  name                    = "data-collection-vm-1"
  target_resource_id      = azurerm_linux_virtual_machine.mylinux.id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.logcollectionrule1.id
  description             = "Associates the collection rule for our first VM"
}

# # a diagnostic setting
# resource "azurerm_monitor_diagnostic_setting" "diagnosticsetting" {
#   name                       = "diagnostic-setting"
#   target_resource_id         = azurerm_linux_virtual_machine.mylinux.id
#   log_analytics_workspace_id = azurerm_log_analytics_workspace.loganws.id
#   storage_account_id         = azurerm_storage_account.logs_storage_account.id

#   metric {
#     category = "AllMetrics"

#     retention_policy {
#       enabled = false
#     }
#   }
# }