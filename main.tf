terraform {

}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

module "state_file" {
  source       = "./modules/resources/state_file"
  environment  = var.environment
  location     = var.location
  account_name = var.account_name
}
