# Network Security Group
resource "azurerm_network_security_group" "nsg" {
  name                = "${var.prefix}-security-group"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Virtual Network (VNET)
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-network"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
}

# Subnet in our main vnet
resource azurerm_subnet "mainsvnet" {
  name           = "${var.prefix}-main-subnet"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = ["10.0.1.0/24"]
}

# Network interface to attach to our subnet
resource "azurerm_network_interface" "main" {
  name = "${var.prefix}-nic"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_configuration {
    name = "default-ip-config"
    subnet_id = azurerm_subnet.mainsvnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Secure our network interface card, associated with the main and only subnet
resource "azurerm_network_interface_security_group_association" "bindnicnsg" {
  network_interface_id = azurerm_network_interface.main.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# Secure our subnet with NSG in case we delete the NIC
resource "azurerm_subnet_network_security_group_association" "bindsvnetnsg" {
  subnet_id = azurerm_subnet.mainsvnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}