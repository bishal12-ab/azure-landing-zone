terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.1.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "MICRORG"
    storage_account_name = "vishalstg"
    container_name       = "vishcont"
    key                  = "dev.terraform.tfstate"
    
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
  subscription_id = "b23d929c-5d14-4285-a3cd-840ec9c55cde"
}

