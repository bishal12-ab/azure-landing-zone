module "rg" {
  source = "../../module/RG"
  rg     = var.rg-details
}

module "vnet" {
  source     = "../../module/VNET"
  vnet       = var.vnet-details
  depends_on = [module.rg]
}
module "subnet" {
  source     = "../../module/SUBNET"
  subnet     = var.subnet-details
  depends_on = [module.vnet, module.rg]
}
module "pip" {
  source     = "../../module/PIP"
  pip        = var.pip-details
  depends_on = [module.rg]
}
module "bastion" {
  source     = "../../module/BASTION"
  bastion    = var.bastion-details
  depends_on = [module.rg, module.vnet, module.subnet, module.pip]

}
module "nic" {
  source     = "../../module/NIC"
  nic        = var.nic-details
  depends_on = [module.subnet]
}
module "vm_linux" {
  source     = "../../module/VM"
  vm_linux   = var.vm-details
  depends_on = [module.nic]

}
module "keyvault" {
  source     = "../../module/KEYVAULT"
  keyvaults  = var.keyvault-details
  depends_on = [module.vm_linux]
}