# Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "loganws" {
    name                = "${var.prefix}-loganws"
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    sku                 = "PerGB2018"
    retention_in_days   = 30
}

# Log facilities we wish to include
variable "required_log_facilities" {
  type = list(string)
  default = [
    "alert",
    "audit",
    "auth",
    "authpriv",
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
    "nopri",
    "ntp",
    "syslog",
    "user"
  ]
}

# Required log levels we wish
variable "required_log_levels" {
  type = list(string)
  default = [
    "Notice",
    "Warning",
    "Error",
    "Critical",
    "Alert",
    "Emergency"
  ]
}

# Log collection rule: forwarding to Analytics Workspace
resource "azurerm_monitor_data_collection_rule" "logcollectionrule1" {
  name = "linuxvm-collection-rule-loganws"
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = azurerm_resource_group.rg.location
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
  }

  # additional info and values at https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_data_collection_rule#syslog
  data_sources {
    syslog {
      name           = "linux-vm-syslog"
      facility_names = var.required_log_facilities
      log_levels     = var.required_log_levels
      streams        = ["Microsoft-Syslog"]
    }
  }

  data_flow {
    streams = ["Microsoft-Syslog"]
    destinations = [
      "destination-log-ws-analytics"
    ]
  }
}

# Association VM > Log Analytics Workspace
resource "azurerm_monitor_data_collection_rule_association" "datacolvm1" {
  name                    = "data-collection-vm-1"
  target_resource_id      = azurerm_linux_virtual_machine.mylinux.id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.logcollectionrule1.id
  description             = "Associates the collection rule for our first VM"
}

# Agent Direct To Store rule: required for Blob type destinations
resource "azurerm_monitor_data_collection_rule" "logcollectionrule2" {
  name = "linuxvm-collection-rule-blobs"
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = azurerm_resource_group.rg.location
  kind                          = "AgentDirectToStore"
  identity {
    type = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aksuid.id]
  }

  destinations {
    storage_blob_direct {
      name               = "destination-storage-blob-direct"
      storage_account_id = azurerm_storage_account.logs_storage_account.id
      container_name     = azurerm_storage_container.logs_storage_container.name
    }
  }

  # additional info and values at https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_data_collection_rule#syslog
  data_sources {
    syslog {
      name           = "linux-vm-syslog"
      facility_names = var.required_log_facilities
      log_levels     = var.required_log_levels
      streams        = ["Microsoft-Syslog"]
    }
  }

  data_flow {
    streams = ["Microsoft-Syslog"]
    destinations = [
      "destination-storage-blob-direct"
    ]
  }
}

# Rule association VM > BLobs
resource "azurerm_monitor_data_collection_rule_association" "datacolvm1blobs" {
  name                    = "data-collection-vm-1-blobs"
  target_resource_id      = azurerm_linux_virtual_machine.mylinux.id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.logcollectionrule2.id
  description             = "Associates the collection rule for our first VM for Blob type destinations"
}
