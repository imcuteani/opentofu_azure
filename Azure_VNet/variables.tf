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
  
}

variable "dns_servers" {
  type        = list(string)
  description = "The dns servers list"
  
}

variable "subnet1_name" {
  type        = string
  description = "The subnet1 name"
  
}

variable "subnet1_address_prefix" {
  type        = string
  description = "The subnet1 address prefix"
  
}

variable "subnet2_name" {
  type        = string
  description = "the subnet 2 name"
  
}

variable "subnet2_address_prefix" {
  type        = string
  description = "the subnet2 address prefix"
 
}

variable "environment" {
  type        = string
  description = "The environment name"
  
}

