terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.4.0"
    }

  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}