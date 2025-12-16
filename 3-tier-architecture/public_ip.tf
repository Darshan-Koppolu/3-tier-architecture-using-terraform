resource "azurerm_public_ip" "pubip" {
  name                = var.pubip
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  location            = azurerm_virtual_network.vnet[0].location
}