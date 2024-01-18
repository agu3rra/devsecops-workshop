# Configure the Azure Resource Manager API's provider
variable "prefix" {
  default = "guerra"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.87.0"
    }
  }

  required_version = ">= 1.6.0"
}

provider "azurerm" {
  features {}
}

# Resource Group: the thing that ties all of the resource together
resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-VmLoggingRg"
  location = "East US"
}

# Creating an user-assigned managed identity for everything
resource "azurerm_user_assigned_identity" "aksuid" {
  location            = azurerm_resource_group.rg.location
  name                = "akv-ua-id"
  resource_group_name = azurerm_resource_group.rg.name
}
