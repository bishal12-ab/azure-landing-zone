resource "azurerm_linux_virtual_machine" "vm_block" {
  for_each                        = var.vm_linux
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = "Standard_D2s_v3"
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  # admin_username = data.azurerm_key_vault_secret.username.value
  # admin_password = data.azurerm_key_vault_secret.password.value
  network_interface_ids           = [data.azurerm_network_interface.networkinterfacedata[each.key].id]
  disable_password_authentication = false
  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}
