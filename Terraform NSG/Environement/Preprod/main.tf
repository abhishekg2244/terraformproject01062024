module "rg" {
 source = "../../Module/rg"
 rg = var.rg
 }

module "vnet" {
  depends_on = [ module.rg ]
  source = "../../Module/vnet"
  vnet = var.vnet

}


module "subnet" {
  depends_on = [ module.rg,module.vnet ]
  source = "../../Module/subnet"
  subnet = var.subnet

}

module "nic" {
  depends_on = [ module.rg,module.vnet,module.subnet ]
  source = "../../Module/nic"
  nic = var.nic
}

module "nsg" {
  depends_on = [ module.rg,module.nic ]
 source = "../../Module/nsg"
  nsg = var.nsg
}

module "nsg_rule" {
  depends_on = [module.rg,module.nsg  ]
  source = "../../Module/nsg_rule"
  nsg_rule = var.nsg_rule
}

module "winvm" {
  depends_on = [ module.rg,module.vnet,module.nic,module.subnet ]
  source = "../../Module/win_vm"
  winvm = var.winvm  
}

module "publicip" {
  depends_on = [ module.rg ]
  source = "../../Module/publicip"
  pip = var.pip
  
  
}

module "bastion" {
  depends_on = [ module.rg,module.vnet,module.subnet,module.publicip ]
  source = "../../Module/bastion"
  bastion = var.bastion
  
}