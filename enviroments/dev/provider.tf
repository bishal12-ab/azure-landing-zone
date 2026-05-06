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
subscription_id = "3a034c22-ce0f-4951-a68e-709434651f18"
}

