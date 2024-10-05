/*
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
*/

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name

}

data "azurerm_client_config" "current" {
}

resource "azurerm_key_vault_managed_hardware_security_module" "hsm" {
  name                       = var.akv_hsm_name
  resource_group_name        = data.azurerm_resource_group.rg.name
  location                   = data.azurerm_resource_group.rg.location
  sku_name                   = var.sku_name
  purge_protection_enabled   = var.purge_protection
  soft_delete_retention_days = var.sd_retention
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  admin_object_ids           = [data.azurerm_client_config.current.object_id]
  public_network_access_enabled = var.public_network_access_enabled
  network_acls {
    bypass = var.nacl_bypass
    default_action = var.default_action
  }

  tags = {
    Env = var.env
  }
}

data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.vnet_rg_name
}

data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = var.vnet_rg_name
}

resource "azurerm_private_endpoint" "pe1" {
  depends_on          = [resource.azurerm_key_vault_managed_hardware_security_module.hsm]
  name                = "${var.akv_hsm_name}-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = data.azurerm_subnet.subnet.id

  private_service_connection {
    name                           = "${var.akv_hsm_name}-privateserviceconnection"
    private_connection_resource_id = azurerm_key_vault_managed_hardware_security_module.hsm.id
    subresource_names              = ["ManagedHSM"]
    is_manual_connection           = false
  }
}
