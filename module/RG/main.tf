resource "azurerm_resource_group" "bastion-block" {
    for_each = var.rg
    name = each.value.name
    location = each.value.location
    
}