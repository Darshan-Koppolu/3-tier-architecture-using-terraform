resource "azurerm_network_security_group" "nsg" {
  count               = length(var.sub_name)
  name                = var.nsg[count.index]
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_virtual_network.vnet[count.index].location

  security_rule {
    name                       = "allow-ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "sub-nsg-assoc" {
  count                     = length(var.nsg)
  subnet_id                 = azurerm_subnet.subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.nsg[count.index].id

}

resource "azurerm_network_security_rule" "web_allow_http" {
  name                       = "allow-http-80"
  priority                   = 101
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "80"
  source_address_prefix      = "*"
  destination_address_prefix = azurerm_subnet.subnet[0].address_prefixes[0]

  network_security_group_name = azurerm_network_security_group.nsg[0].name
  resource_group_name         = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_rule" "app_allow_8080" {
  name                       = "allow-web-to-app-8080"
  priority                   = 102
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "8080"
  source_address_prefix      = azurerm_subnet.subnet[0].address_prefixes[0]
  destination_address_prefix = azurerm_subnet.subnet[1].address_prefixes[0]

  network_security_group_name = azurerm_network_security_group.nsg[1].name
  resource_group_name         = azurerm_resource_group.rg.name
}
resource "azurerm_network_security_rule" "db_allow_app_3306" {
  name                       = "allow-app-3306"
  priority                   = 101
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "3306"
  source_address_prefix      = azurerm_subnet.subnet[1].address_prefixes[0]
  destination_address_prefix = azurerm_subnet.subnet[2].address_prefixes[0]

  network_security_group_name = azurerm_network_security_group.nsg[2].name
  resource_group_name         = azurerm_resource_group.rg.name
}
