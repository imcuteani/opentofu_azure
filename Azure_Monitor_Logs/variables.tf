variable "subscription_id"{
    type = string
    description = "The subscription id"
    
}

variable "resource_group_name" {
  type        = string
  description = "The resource group name"
  
}

variable "location" {
  type        = string
  description = "The resource group location"
  
}

variable "eventhub_authorization_rule_name" {
  type        = string
  description = "The event hub authorization rule name"
  
}

variable "eventhub_ns" {
  type        = string
  description = "The event hub namespace"
  

}

variable "eventhub_name" {
  type        = string
  description = "The event hub name"
  
}

variable "activitylogs_name" {
  type        = string
  description = "The Activity logs name"
  
}