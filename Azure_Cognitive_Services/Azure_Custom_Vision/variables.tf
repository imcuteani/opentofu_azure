variable "resource_group_name" {
  type        = string
  description = "The resource group name"
}

variable "location" {
  type        = string
  description = "The resource group location"
}

variable "cv_training_name" {
  type        = string
  description = "The Azure CV training name"
}

variable "cv_prediction_name" {
  type        = string
  description = "The Azure CV prediction name"
}

variable "training_tier" {
  type        = string
  description = "The tier for Azure AI CV training service"

}

variable "prediction_tier" {
  type        = string
  description = "The tier for Azure AI CV prediction service"
}

variable "vnet_name" {
  type        = string
  description = "The VNet name"
}

variable "vnet_rg_name" {
  type        = string
  description = "The VNet resource group name"
}

variable "subnet_name" {
  type        = string
  description = "the subnet name"
}

variable "pe_name" {
  type        = string
  description = "The private endpoint name"
}

variable "prediction_pe_name" {
  type        = string
  description = "The prediction private endpoint name"
}






