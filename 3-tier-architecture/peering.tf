resource "azurerm_virtual_network_peering" "vnet01-vnet02" {
  name                      = var.web-app-peer
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet[0].name
  remote_virtual_network_id = azurerm_virtual_network.vnet[1].id
  depends_on                = [azurerm_virtual_network.vnet]

}

resource "azurerm_virtual_network_peering" "vnet02-vnet01" {
  name                      = var.app-web-peer
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet[1].name
  remote_virtual_network_id = azurerm_virtual_network.vnet[0].id
  depends_on                = [azurerm_virtual_network.vnet]

}

resource "azurerm_virtual_network_peering" "vnet02-vnet03" {
  name                      = var.app-db-peer
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet[1].name
  remote_virtual_network_id = azurerm_virtual_network.vnet[2].id
  depends_on                = [azurerm_virtual_network.vnet]
}
resource "azurerm_virtual_network_peering" "vnet03-vnet02" {
  name                      = var.db-app-peer
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet[2].name
  remote_virtual_network_id = azurerm_virtual_network.vnet[1].id
  depends_on                = [azurerm_virtual_network.vnet]
}