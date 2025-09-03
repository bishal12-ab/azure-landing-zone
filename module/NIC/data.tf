data "azurerm_subnet" "datasubnetbas" {
    for_each = var.nic
  name                 = each.value.subname
  virtual_network_name = each.value.vnet
  resource_group_name  = each.value.resource_group_name
}
data "azurerm_public_ip" "pipdata" {
    for_each = var.nic
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}
