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

variable "akv_hsm_name" {
  type        = string
  description = "The AKV HSM name"
  default     = "<your_akv_hsm_name>"
}

variable "public_network_access_enabled" {
  type = bool
  description = "The public network access settings"
  default = false
}

variable "sku_name" {
  type        = string
  description = "The SKU of the AKV managed HSM"
  default     = "Standard_B1"
}

variable "purge_protection" {
  type        = bool
  description = "The purge protection enablement"
  default     = true
}

variable "sd_retention" {
  type        = string
  description = "The soft delete retention days"
  default     = "30"
}

variable "env" {
  type        = string
  description = "The environment tiers"
  default     = "dev"
}

variable "nacl_bypass" {
  type = string
  description = "The NACL bypass resources"
  default = "AzureServices"
}

variable "default_action" {
  type = string
  description = "The default action for Network ACL"
  default = "Allow"
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

