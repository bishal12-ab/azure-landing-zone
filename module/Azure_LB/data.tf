data "azurerm_public_ip" "datablockpip" {
    for_each = var.loadblacer
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}