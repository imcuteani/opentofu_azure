data "azure_resource_group" "rg"{
    name = var.resource_group_name
}

# The Azure Container Registry 

resource "azurerm_container_registry" "acr"{
    name = var.acr_name
    resource_group_name = var.resource_group_name
    location = var.location
    sku = var.sku_name
    
        identity {
            type = var.identity_type
            identity_id = [azurerm_user_assigned_identity.azui.id]
        }
    encryption {
        enabled = var.encryption_enablement
        key_vault_key_id = data.azurerm_key_vault_akv_id
        identity_client_id = azurerm_user_assigned_identity.azui.id
    }

    georeplications {
      location = var.georeplication_name
      zone_redundancy_enabled = var.zone_redundancy_enabled
      tags = {
        "environment" = var.environment
      }
    }
}

resource "azurerm_user_assigned_identity" "azui" {
    resource_group_name = var.resource_group_name
    location = var.location
    name = var.azui_name
  
}

data "azurerm_key_vault" "akv"{
    name = var.akv_name
    key_vault_id = data.azurerm_key_vault.akv.id
    resource_group_name = var.resource_group_name

}