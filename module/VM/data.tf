data "azurerm_network_interface" "networkinterfacedata" {
    for_each = var.vm_linux
  name                = each.value.nicname
  resource_group_name = each.value.resource_group_name
}
