terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.1.0"
    }
  }
   backend "azurerm" {
    resource_group_name  = "backend_rg"
    storage_account_name = "vishalstorage123455"
    container_name       = "rajaranicontainer"
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
subscription_id = "77312bdf-fff4-4e77-9d06-5e69870a682c"
}

