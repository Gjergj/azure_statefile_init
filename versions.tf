terraform {
  required_version = "~>v1.10.5"
  required_providers {
    azurerm = {
      version = "~>4.20.0"
      source  = "hashicorp/azurerm"
    }
  }
}
