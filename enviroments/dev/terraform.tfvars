rg-details = {
  rg1 = {
    name     = "bastionrg1"
    location = "centralindia"
  }
}
vnet-details = {
  vnet1 = {
    name                = "bastion-vnet"
    resource_group_name = "bastionrg1"
    location            = "centralindia"
    address_space       = ["10.0.0.0/16"]
  }
}
subnet-details = {
  subnet1 = {
    name                 = "frontsubnet"
    resource_group_name  = "bastionrg1"
    virtual_network_name = "bastion-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "backsubnet"
    resource_group_name  = "bastionrg1"
    virtual_network_name = "bastion-vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
  subnet3 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "bastionrg1"
    virtual_network_name = "bastion-vnet"
    address_prefixes     = ["10.0.3.0/24"]
  }
}

pip-details = {
  pip1 = {
    name                = "bastionpip"
    resource_group_name = "bastionrg1"
    location            = "centralindia"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "frontpip"
    resource_group_name = "bastionrg1"
    location            = "centralindia"
    allocation_method   = "Static"
  }
  pip3 = {
    name                = "backpip"
    resource_group_name = "bastionrg1"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}
bastion-details = {
  bastion1 = {
    name                = "bastionvish"
    location            = "centralindia"
    resource_group_name = "bastionrg1"
    vnet                = "bastion-vnet"
    subname             = "AzureBastionSubnet"
    pip_name            = "bastionpip"
    allocation_method   = "Static"
  }
}
nic-details = {
  nic1 = {
    name                = "nic-core"
    location            = "centralindia"
    resource_group_name = "bastionrg1"
    vnet                = "bastion-vnet"
    subname             = "frontsubnet"
    pip_name           = "frontpip"
  }
  nic2 = {
    name                = "nic-core1"
    location            = "centralindia"
    resource_group_name = "bastionrg1"
    vnet                = "bastion-vnet"
    subname             = "backsubnet"
    pip_name           = "backpip"
  }
}
nsg-details = {
  nsg1 = {
    name                = "nsg-core1"
    location            = "centralindia"
    resource_group_name = "bastionrg1"
    vnet                = "bastion-vnet"
    subname             = "frontsubnet"
    nicname             = "nic-core"
  }
  nsg2 = {
    name                = "nsg-core2"
    location            = "centralindia"
    resource_group_name = "bastionrg1"
    vnet                = "bastion-vnet"
    subname             = "backsubnet"
    nicname             = "nic-core1"
  }
}
vm-details = {
  vm1 = {
    name                = "frontendvm1"
    resource_group_name = "bastionrg1"
    location            = "centralindia"
    vnet                = "bastion-vnet"
    subname             = "frontsubnet"
    nicname             = "nic-core"
    pip_name           = "frontpip"
    admin_username      = "admidvishal"
    admin_password      = "adminuser@12345"
  }
  vm2 = {
    name                = "backvm2"
    resource_group_name = "bastionrg1"
    location            = "centralindia"
    vnet                = "bastion-vnet"
    nicname             = "nic-core1"
    subname             = "backsubnet"
    pip_name           = "backpip"
    admin_username      = "admidvishal"
    admin_password      = "adminuser@12345"
  }
}
keyvault-details = {
  keyvault1 = {
    name                        = "vishalkeyvault123"
    resource_group_name         = "bastionrg1"
    location                    = "centralindia"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
  }
}
acr-details = {
  acr1 = {
    name                = "bestacr12345"
    resource_group_name = "bastionrg1"
    location            = "centralindia"
    sku                 = "Premium"
    admin_enabled       = false
    Environment         = "PROD"
  }
}
aks-details = {
  aks1 = {
    name                = "team8910devaks"
    location            ="centralindia"
    resource_group_name = "bastionrg1"
    dns_prefix          = "aks-1"
    pool_name           = "team6node"
    node_count          = 1
    vm_size             = "Standard_D2s_v3"
    Environment         = "development"
  }
}
