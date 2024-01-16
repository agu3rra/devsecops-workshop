# Virtual Machine (we pay just to keep it alive; perhaps not while sleeping...)
resource "azurerm_linux_virtual_machine" "mylinux" {
  name = "${var.prefix}-mylinux"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  size = "Standard_B1ls"
  admin_username = "iamgroot"
  admin_ssh_key {
    username = "iamgroot"
    public_key = file("~/.ssh/azure-devops-workshop/id_rsa.pub")
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
    sku = "minimal-18_04-lts"
    version = "18.04.202212090"
  }
}
