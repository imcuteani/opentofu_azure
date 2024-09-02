output "azurerm_machine_learning_workspace_id" {
  value = azurerm_machine_learning_workspace.aml.id
}

output "azurerm_storage_account_id" {
  value = azurerm_storage_account.sa.id
}

output "azurerm_key_vault_id" {
  value = azurerm_key_vault.akv.id
}

output "azurerm_application_insights_id" {
  value = azurerm_application_insights.app.id
}