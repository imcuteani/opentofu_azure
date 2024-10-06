data "azurerm_resource_group" "example" {
  name = var.resource_group_name

}

resource "azurerm_cognitive_account" "custom_vision_training" {
  name                          = var.cv_training_name
  location                      = data.azurerm_resource_group.example.location
  resource_group_name           = data.azurerm_resource_group.example.name
  kind                          = var.training_tier
  custom_subdomain_name         = var.cv_training_name
  public_network_access_enabled = false


  sku_name = "S0"

  tags = {
    Acceptance = "Test"
  }
}

resource "azurerm_cognitive_account" "custom_vision_prediction" {
  name                          = var.cv_prediction_name
  location                      = data.azurerm_resource_group.example.location
  resource_group_name           = data.azurerm_resource_group.example.name
  kind                          = var.prediction_tier
  custom_subdomain_name         = var.cv_prediction_name
  public_network_access_enabled = false


  sku_name = "S0"

  tags = {
    Acceptance = "Test"
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

resource "azurerm_private_endpoint" "pe" {
  depends_on          = [resource.azurerm_cognitive_account.custom_vision_training]
  name                = var.pe_name
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name
  subnet_id           = data.azurerm_subnet.subnet.id

  private_service_connection {
    name                           = "${var.cv_training_name}-privateserviceconnection1"
    private_connection_resource_id = azurerm_cognitive_account.custom_vision_training.id
    subresource_names              = ["account"]
    is_manual_connection           = false
  }
}
/*
resource "azurerm_private_endpoint" "prediction-pe" {
  depends_on          = [resource.azurerm_cognitive_account.custom_vision_prediction]
  name                = var.prediction_pe_name
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name
  subnet_id           = data.azurerm_subnet.subnet.id

  private_service_connection {
    name                           = "${var.cv_prediction_name}-privateserviceconnection2"
    private_connection_resource_id = azurerm_cognitive_account.custom_vision_prediction.id
    subresource_names              = ["account"]
    is_manual_connection           = false
  }
}
*/


    