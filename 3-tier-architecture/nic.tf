resource "azurerm_network_interface" "nic" {
  count               = length(var.vms)
  name                = var.nic-card[count.index]
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_virtual_network.vnet[count.index].location

  ip_configuration {
    name                          = var.nic-ip-config[count.index]
    subnet_id                     = azurerm_subnet.subnet[count.index].id
    private_ip_address_allocation = "Dynamic"

    public_ip_address_id = count.index == 0 ? azurerm_public_ip.pubip.id : null
  }

}