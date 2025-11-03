resource "azurerm_kubernetes_cluster" "aks-blk" {
    for_each = var.aks
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = "aks-1"
  default_node_pool {
    name       = each.value.pool_name
    node_count = each.value.node_count
    vm_size    = each.value.vm_size
  }
  identity {
    type = "SystemAssigned"
  }
  tags = {
    Environment = each.value.Environment
  }
}

