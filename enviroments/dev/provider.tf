terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.1.0"
    }
  }
   backend "azurerm" {
    resource_group_name  = "backendv_group"
    storage_account_name = "vish12344"
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
subscription_id = "3932b5be-57e9-448f-8092-d5058b82f170"
}

