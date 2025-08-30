data "azurerm_subnet" "datasubnetbas" {
    for_each = var.bastion
  name                 = "AzureBastionSubnet"
  virtual_network_name = each.value.vnet
  resource_group_name  = each.value.resource_group_name
}
data "azurerm_public_ip" "datapip" {
  for_each = var.bastion
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}