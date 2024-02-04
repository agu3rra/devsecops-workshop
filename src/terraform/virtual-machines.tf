# Virtual Machine (we pay just to keep it alive; perhaps not while sleeping...)
resource "azurerm_linux_virtual_machine" "mylinux" {
  name = "${var.prefix}-mylinux"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  size = "Standard_B1ls"
  admin_username = "iamgroot"
  admin_ssh_key {
    username = "iamgroot"
    public_key = file("~/.ssh/id_rsa.pub")
  }
  network_interface_ids = [
    azurerm_network_interface.main.id
  ]

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer = "UbuntuServer"
    sku = "18.04-LTS"
    version = "latest"
  }

  identity {
    type = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aksuid.id]
  }
}

# Azure Monitoring Agent install in the VM. Easy log forwarding.
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
