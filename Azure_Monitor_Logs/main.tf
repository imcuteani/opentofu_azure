data "azurerm_subscription" "current" {
  subscription_id = var.subscription_id
}

data "azurerm_eventhub_namespace_authorization_rule" "ehns" {
  name                = var.eventhub_authorization_rule_name
  resource_group_name = var.resource_group_name
  namespace_name      = var.eventhub_ns
}

resource "azurerm_monitor_diagnostic_setting" "activity-logs" {
  name                           = var.activitylogs_name
  target_resource_id             = data.azurerm_subscription.current.id
  eventhub_name                  = var.eventhub_name
  eventhub_authorization_rule_id = data.azurerm_eventhub_namespace_authorization_rule.ehns.id

  enabled_log {
    category = "Administrative"
  }
  enabled_log {
    category = "Autoscale"
  }
}