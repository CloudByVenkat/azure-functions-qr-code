terraform {
  required_providers {
    azurerm = {
      source = "registry.terraform.io/hashicorp/azurerm"
      version = "~> 4.57.0" # we want to lock terraform provider version
    }
  }
  required_version = ">= 1.14.3" # This is terraform installed version

}

provider "azurerm" {
    subscription_id = var.subscription_id
    client_id = var.client_id
    client_secret = var.client_secret
    tenant_id = var.tenant_id
    features {
      
    }

  # Configuration options
}