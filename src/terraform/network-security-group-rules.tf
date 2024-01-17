resource "azurerm_network_security_rule" "AllowSpecificIpInBoundSsh" {
    name                       = "AllowSpecificIpInBoundSsh"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "177.220.174.166"
    destination_address_prefix = "*"
    resource_group_name = azurerm_resource_group.rg.name
    network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_network_security_rule" "AllowSpecificIpOutBoundSsh" {
    name                       = "AllowSpecificIpOutBoundSsh"
    priority                   = 102
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "177.220.174.166"
    destination_address_prefix = "*"
    resource_group_name = azurerm_resource_group.rg.name
    network_security_group_name = azurerm_network_security_group.nsg.name
}

# Outbound connections to Azure Monitor
# DNS entries were resolved via ping. These rules will need to be updated or scripted in some form in case these change over time.
# Automation idea: ping these resources and change the terraform files dynamically via a provisioning pipeline.
# global.handler.control.monitor.azure.com
resource "azurerm_network_security_rule" "AllowAzureMonitorGlobal" {
    name                       = "AllowAzureMonitorGlobal"
    priority                   = 103
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "191.234.136.84"
    resource_group_name = azurerm_resource_group.rg.name
    network_security_group_name = azurerm_network_security_group.nsg.name
}
# eastus.handler.control.monitor.azure.com
resource "azurerm_network_security_rule" "AllowAzureMonitorEastUs" {
    name                       = "AllowAzureMonitorEastUs"
    priority                   = 104
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "20.49.109.88"
    resource_group_name = azurerm_resource_group.rg.name
    network_security_group_name = azurerm_network_security_group.nsg.name
}

# <log-analytics-workspace-id>.ods.opinsights.azure.com
# Workspace ID: f4a01be1-2c31-422b-bbef-78e86da34134.ods.opinsights.azure.com
resource "azurerm_network_security_rule" "AllowAzureMonitorLAW" {
    name                       = "AllowAzureMonitorLAW"
    priority                   = 105
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "20.42.73.204"
    resource_group_name = azurerm_resource_group.rg.name
    network_security_group_name = azurerm_network_security_group.nsg.name
}