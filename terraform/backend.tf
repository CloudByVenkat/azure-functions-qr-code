terraform {
  backend "azurerm" {
    resource_group_name = "rg-prod-can"
    storage_account_name = "stortri01"
    container_name = "tfstate"
    key = "day18.terraform.tfstate"
  }
}