variable "resource_group_name" {
  type        = string
  description = "The resource group name"
  
}

variable "location" {
  type        = string
  description = "The resource group location"
  
}

variable "az_vnet_name" {
  type        = string
  description = "The Azure VNet name"
 
}

variable "vnet_address_space" {
  type        = list(string)
  description = "The VNet address space"
  default     = ["10.38.1.0/25"]
}

variable "dns_servers" {
  type        = list(string)
  description = "The dns servers list"
  default     = ["10.38.6.228", "10.36.0.228"]
}

variable "subnet1_name" {
  type        = string
  description = "The subnet1 name"
  default     = "Sub-AM-00001"
}

variable "subnet1_address_prefix" {
  type        = string
  description = "The subnet1 address prefix"
  default     = "10.38.1.0/26"
}

variable "subnet2_name" {
  type        = string
  description = "the subnet 2 name"
  default     = "Sub-AM-00002"
}

variable "subnet2_address_prefix" {
  type        = string
  description = "the subnet2 address prefix"
  default     = "10.38.1.64/26"
}

variable "environment" {
  type        = string
  description = "The environment name"
  default     = "dev"
}

