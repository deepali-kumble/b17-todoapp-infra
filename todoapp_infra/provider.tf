terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.36.0"
    }
  }
}

provider "azurerm" {

  subscription_id = "2c279754-9ded-4271-a952-14fe81a08ff4"
  features {

  }

}
