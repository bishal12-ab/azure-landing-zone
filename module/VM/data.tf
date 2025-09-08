data "azurerm_network_interface" "networkinterfacedata" {
    for_each = var.vm_linux
  name                = each.value.nicname
  resource_group_name = each.value.resource_group_name
}
data "azurerm_key_vault" "datakeyvault_blk" {
  name                = "mahesh-keyvault1"
  resource_group_name = "mahesh-rg"
}


data "azurerm_key_vault_secret" "username" {
  name         = "username"
  key_vault_id = data.azurerm_key_vault.datakeyvault_blk.id
}

data "azurerm_key_vault_secret" "password" {
  name         = "vmpassword"
  key_vault_id = data.azurerm_key_vault.datakeyvault_blk.id
}