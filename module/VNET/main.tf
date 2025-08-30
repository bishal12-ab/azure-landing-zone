resource "azurerm_virtual_network" "vnet-block" {
  for_each            = var.vnet
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  address_space       = ["10.0.0.0/16"]

}
