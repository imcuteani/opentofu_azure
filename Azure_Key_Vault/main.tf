data "azurerm_client_config" "current" {}

locals {
  current_user_id = coalesce(var.msi_id, data.azurerm_client_config.current.object_id)
}



resource "azurerm_key_vault" "akv" {
  name                = var.akv_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
  access_policy {
    tenant_id          = data.azurerm_client_config.current.tenant_id
    object_id          = local.current_user_id
    key_permissions    = var.key_permissions
    secret_permissions = var.secret_permissions
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
  depends_on          = [resource.azurerm_key_vault.akv]
  name                = "${var.akv_name}-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = data.azurerm_subnet.subnet.id

  private_service_connection {
    name                           = "${var.akv_name}-privateserviceconnection"
    private_connection_resource_id = azurerm_key_vault.akv.id
    subresource_names              = ["Vault"]
    is_manual_connection           = false
  }
}