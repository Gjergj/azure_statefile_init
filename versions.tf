terraform {
  required_version = "~>v1.10.5"
  required_providers {
    azurerm = {
      version = "=3.0.0"
      source  = "hashicorp/azurerm"
    }
  }
}
