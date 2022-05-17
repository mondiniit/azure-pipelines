terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
backend "azurerm" {
        resource_group_name  = "tfstate"
        storage_account_name = "pruebamondini"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
    }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

/* resource "azurerm_resource_group" "rg" {
  name     = "pe_globant"
  location = "westus2"
} */

resource "azurerm_storage_account" "example" {
  name                     = "pruebamondini"
  resource_group_name      = "pe_globant"
  location                 = "eastus2"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}