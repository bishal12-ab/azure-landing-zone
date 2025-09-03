resource "azurerm_network_security_group" "nsg_blk" {
    for_each = var.nsg
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_network_interface_security_group_association" "nic_nsg_association" {
    for_each = var.nsg
  network_interface_id      = data.azurerm_network_interface.networkinterfacedata[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg_blk[each.key].id
}