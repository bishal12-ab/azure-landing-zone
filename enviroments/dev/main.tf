module "rg" {
  source = "../../module/RG"
  rg     = var.rg-details
}

module "vnet" {
  source     = "../../module/VNET"
  vnet       = var.vnet-details
  depends_on = [module.rg]
}
# module "subnet" {
#   source     = "../../module/SUBNET"
#   subnet     = var.subnet-details
#   depends_on = [module.vnet, module.rg]
# }
module "pip" {
  source     = "../../module/PIP"
  pip        = var.pip-details
  depends_on = [module.rg]
}
module "bastion" {
  source     = "../../module/BASTION"
  bastion    = var.bastion-details
  depends_on = [module.rg, module.vnet, module.pip]

}
module "nic" {
  source     = "../../module/NIC"
  nic        = var.nic-details
  depends_on = [module.rg, module.vnet]
}
module "nsg" {
  source     = "../../module/NSG"
  nsg        = var.nsg-details
  depends_on = [module.rg, module.nic]
  
}
 module "vm_linux" {
  source     = "../../module/VM"
  vm_linux   = var.vm-details
  depends_on = [module.nic]

}
module "keyvault" {
  source     = "../../module/KEYVAULT"
  keyvaults  = var.keyvault-details
  depends_on = [module.rg]
}
module "acr" {
  source     = "../../module/ACR"
  acr        = var.acr-details
  depends_on = [module.rg]  
}
module "aks" {
  source     = "../../module/AKS"
  aks        = var.aks-details
  depends_on = [module.rg, module.acr]
  
}
#module "loadblacer" {
 # source = "../../module/Azure_LB"
  #loadblacer = var.loadblacer-details
  #depends_on = [module.pip, module.nic, module.vm_linux]
#}
module "azure_server_database" {
  source = "../../module/Azure_SQL_Server"
  sql_server = var.sql_server_details

