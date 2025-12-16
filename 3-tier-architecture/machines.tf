resource "azurerm_linux_virtual_machine" "vms" {
  count                           = length(var.vms)
  name                            = var.vms[count.index]
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_virtual_network.vnet[count.index].location
  size                            = "Standard_D2s_v3"
  admin_username                  = "darshan"
  admin_password                  = "password@123"
  disable_password_authentication = false

  network_interface_ids = [azurerm_network_interface.nic[count.index].id]

  os_disk {
    name                 = var.disk-name[count.index]
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}
