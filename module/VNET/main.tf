resource "azurerm_virtual_network" "vnet-block" {
  for_each            = var.vnet
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  address_space       = ["10.0.0.0/16"]
 dynamic subnet {
  for_each = each.value.subnets
    content {
      name             = subnet.value.name
      address_prefixes = subnet.value.address_prefixes
      security_group   = lookup(subnet.value, "security_group", null)
    }
    
  }
}
