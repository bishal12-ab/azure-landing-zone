terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.1.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "myrg"
    storage_account_name = "stgtestingvishal"
    container_name       = "testcontainer"
    key                  = "terraform.tfstate"
    
  }
}
provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
subscription_id = "e68115ea-4d91-49bd-814a-4725aba743a1"
}

