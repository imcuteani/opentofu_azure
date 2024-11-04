output "azure_acr_id" {
  value = azurerm_container_registry.acr.id
}

output "azure_keyvault_id"{
    value = azurerm_key_vault.akv.id
}