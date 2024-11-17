/*
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
*/

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_cosmosdb_account" "db" {
  name                = var.cosmosdb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = var.offer_type
  kind                = var.db_kind


  automatic_failover_enabled         = var.automatic_failover_enabled
  minimal_tls_version                = var.minimal_tls_version
  free_tier_enabled                  = var.free_tier_enabled
  analytical_storage_enabled         = var.analytical_storage_enabled
  partition_merge_enabled            = var.partition_merge_enabled
  burst_capacity_enabled             = var.burst_capacity_enabled
  public_network_access_enabled      = var.public_network_access_enabled
  multiple_write_locations_enabled   = var.multiple_write_locations_enabled
  access_key_metadata_writes_enabled = var.access_key_metadata_writes_enabled

  consistency_policy {
    consistency_level = var.consistency_level
  }

  capacity {
    total_throughput_limit = var.total_throughput_limit
  }

  backup {
    type                = var.backup_type
    storage_redundancy  = var.storage_redundancy
    interval_in_minutes = var.interval_in_minutes
    retention_in_hours  = var.retention_in_hours
  }


  geo_location {
    location          = var.geo_location
    failover_priority = var.failover_priority
    zone_redundant    = var.zone_redundant
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
  depends_on          = [resource.azurerm_cosmosdb_account.db]
  name                = "${var.cosmosdb_name}-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = data.azurerm_subnet.subnet.id

  private_service_connection {
    name                           = "${var.cosmosdb_name}-privateserviceconnection"
    private_connection_resource_id = azurerm_cosmosdb_account.db.id
    subresource_names              = ["Sql"]
    is_manual_connection           = false
  }
}