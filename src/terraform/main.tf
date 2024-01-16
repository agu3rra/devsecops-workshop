# Configure the Azure Resource Manager API's provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.87.0
    }
  }

  required_version = ">= 1.6.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "guerraVmLoggingRg"
  location = "East US"
}

# Resource VNET

# Resource Network Security Group

# Resource Azure Key Vault

# Resource VM

# Resource IP address?

# Resource Azure Blob Storage

# Resource Azure Function
