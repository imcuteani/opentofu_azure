resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
/*
resource "azurerm_network_security_group" "nsg" {
  name                = var.network_security_group_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
*/

resource "azurerm_virtual_network" "vnet" {
  name                = var.az_vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.vnet_address_space
  dns_servers = var.dns_servers



  subnet {
    name           = var.subnet1_name
    address_prefix = var.subnet1_address_prefix
  }

  subnet {
    name           = var.subnet2_name
    address_prefix = var.subnet2_address_prefix
    #security_group = azurerm_network_security_group.nsg.id
  }

  tags = {
    environment = var.environment
  }
}