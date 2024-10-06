output "azure_custom_vision_training_id"{
    value = azurerm_cognitive_account.custom_vision_training.id
}

output "azure_custom_vision_prediction_id" {
    value = azurerm_cognitive_account.custom_vision_prediction.id
}