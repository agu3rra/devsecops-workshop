# Configure the Azure Resource Manager API's provider
variable "prefix" {
  default = "guerra"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.55.0"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

# Resource Group: the thing that ties all of the resource together
resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-VmLoggingRg"
  location = "East US"
}

# Azure Monitor

# Azure Event Grid

# Resource Azure Key Vault

# Resource Azure Function (pay per call)
