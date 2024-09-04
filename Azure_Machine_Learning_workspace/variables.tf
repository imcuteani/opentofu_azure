variable "resource_group_name" {
  type        = string
  description = "The resource group name"
  default     = "cen_in_rg_00001"

}

variable "location" {
  type        = string
  description = "The resource group location"
  default     = "Central India"

}

variable "ai_name" {
  type        = string
  description = "The app insights name"
  default     = "glamlaidemo"
}

variable "akv_name" {
  type        = string
  description = "The AKV name"
  default     = "glakvdemo"
}

variable "sa_name" {
  type        = string
  description = "The storage account name"
  default     = "glstgdemo"
}

variable "aml_workspace_name" {
  type        = string
  description = "The aml workspace name"
  default     = "glamlwsdemo"
}

variable "msi_id" {
  type        = string
  description = "the managed service identity id"
  default     = null
}

variable "vnet_name" {
  type        = string
  description = "The VNet name"
  default     = "<your_vnet_name>"
}

variable "subnet_name" {
  type        = string
  description = "The subnet name"
  default     = "default"
}

variable "vnet_rg_name" {
  type        = string
  description = "The vnet rg name"
  default     = "<your_vnet_rg_name>"
}

variable "key_permissions" {
  type        = list(string)
  description = "List of key permissions"
  default     = ["List"]
}

variable "secret_permissions" {
  type        = list(string)
  description = "List of secret permissions"
  default     = ["Set"]
}