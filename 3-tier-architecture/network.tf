resource "azurerm_virtual_network" "vnet" {
  count               = length(var.vnet_name)
  name                = var.vnet_name[count.index]
  location            = var.vnet_location[count.index]
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = [var.address_space[count.index]]
  depends_on          = [azurerm_resource_group.rg]
}

resource "azurerm_subnet" "subnet" {
  count                = length(var.sub_name)
  name                 = var.sub_name[count.index]
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet[count.index].name
  address_prefixes     = [var.address_prefixes[count.index]]
  depends_on           = [azurerm_virtual_network.vnet]
}