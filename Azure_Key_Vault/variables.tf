variable "resource_group_name" {
  type        = string
  description = "The resource group name"
  default     = "<your_rg_name>"

}

variable "location" {
  type        = string
  description = "The resource group location"
  default     = "<your_location>"

}
variable "akv_name" {
  type        = string
  description = "The AKV name"
  default     = "<your_akv_name>"
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
  default     = "<your_subnet_name>"
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
