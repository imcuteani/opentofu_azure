variable "resource_group_name" {
  type        = string
  description = "The resource group name"
  

}

variable "location" {
  type        = string
  description = "The resource group location"
  
}

variable "ai_name" {
  type        = string
  description = "The app insights name"
  
}

variable "akv_name" {
  type        = string
  description = "The AKV name"
  
}

variable "sa_name" {
  type        = string
  description = "The storage account name"
  
}

variable "aml_workspace_name" {
  type        = string
  description = "The aml workspace name"
  
}

variable "msi_id" {
  type        = string
  description = "the managed service identity id"
  
}

variable "vnet_name" {
  type        = string
  description = "The VNet name"
  
}

variable "subnet_name" {
  type        = string
  description = "The subnet name"
}

variable "vnet_rg_name" {
  type        = string
  description = "The vnet rg name"
  
}

variable "key_permissions" {
  type        = list(string)
  description = "List of key permissions"
  
}

variable "secret_permissions" {
  type        = list(string)
  description = "List of secret permissions"
  
}