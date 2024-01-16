# Configure the Azure Resource Manager API's provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.16.0"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

# Resource Group: the thing that ties all of the resource together
resource "azurerm_resource_group" "rg" {
  name     = "guerraVmLoggingRg"
  location = "East US"
}

# Network Security Group
resource "azurerm_network_security_group" "guerra_nsg" {
  name                = "guerra-security-group"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Virtual Network (VNET)
resource "azurerm_virtual_network" "guerra_vnet" {
  name                = "guerra-network"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "main-subnet"
    address_prefix = "10.0.1.0/24"
    security_group = azurerm_network_security_group.guerra_nsg.id
  }

  tags = {
    environment = "Testing"
  }
}

# Resource Azure Key Vault

# Resource VM

# Resource IP address?

# Resource Azure Blob Storage

# Resource Azure Function
