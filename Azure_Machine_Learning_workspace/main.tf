data "azurerm_client_config" "current" {}

locals {
  current_user_id = coalesce(var.msi_id, data.azurerm_client_config.current.object_id)
}


resource "azurerm_application_insights" "app" {
  name                = var.ai_name
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"
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

resource "azurerm_storage_account" "sa" {
  name                     = var.sa_name
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_machine_learning_workspace" "aml" {
  name                    = var.aml_workspace_name
  location                = var.location
  resource_group_name     = var.resource_group_name
  application_insights_id = azurerm_application_insights.app.id
  key_vault_id            = azurerm_key_vault.akv.id
  storage_account_id      = azurerm_storage_account.sa.id


  identity {
    type = "SystemAssigned"
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

resource "azurerm_private_endpoint" "pe2" {
  depends_on          = [resource.azurerm_storage_account.sa]
  name                = "${var.sa_name}-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = data.azurerm_subnet.subnet.id

  private_service_connection {
    name                           = "${var.sa_name}-privateserviceconnection"
    private_connection_resource_id = azurerm_storage_account.sa.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }
}

resource "azurerm_private_endpoint" "pe3" {
  depends_on          = [resource.azurerm_machine_learning_workspace.aml]
  name                = "${var.aml_workspace_name}-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = data.azurerm_subnet.subnet.id

  private_service_connection {
    name                           = "${var.aml_workspace_name}-privateserviceconnection"
    private_connection_resource_id = azurerm_machine_learning_workspace.aml.id
    subresource_names              = ["amlworkspace"]
    is_manual_connection           = false
  }
}

