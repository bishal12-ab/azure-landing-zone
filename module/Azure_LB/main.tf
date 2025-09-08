resource "azurerm_lb" "loadblancer_blk" {
    for_each = var.loadblacer
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = data.azurerm_public_ip.datablockpip[each.key].id
  }
}
resource "azurerm_lb_backend_address_pool" "backendpool_blk" {
    for_each = var.loadblacer
  loadbalancer_id = azurerm_lb.loadblancer_blk[each.key].id
  name            = each.value.pool_name
}
resource "azurerm_lb_probe" "healthprobe_blk" {
    for_each = var.loadblacer
  loadbalancer_id = azurerm_lb.loadblancer_blk[each.key].id
  name            = "health-probe"
  protocol        = "Tcp"
  port            = 22
}
resource "azurerm_lb_rule" "loadblancer_rule_blk" {
    for_each = var.loadblacer
  loadbalancer_id                = azurerm_lb.loadblancer_blk[each.key].id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  =80
  backend_port                   =80
  frontend_ip_configuration_name = "PublicIPAddress"
}