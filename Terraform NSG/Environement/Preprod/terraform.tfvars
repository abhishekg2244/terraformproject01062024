rg ={
    rg1 ={
        name = "example-resources"
        location = "West Europe"
    }
}

vnet = {
    vnet1 ={
       name                = "prepodvnet"
       address_space       = ["10.0.0.0/16"]
       location            = "West Europe"
       resource_group_name = "example-resources"
}
    
}

subnet = {
  subnet1 ={
      name                 = "fontendsubnet"
      resource_group_name  = "example-resources"
      virtual_network_name = "prepodvnet"
      address_prefixes     = ["10.0.2.0/24"]
    }
    subnet2 ={
      name                 = "AzureBastionSubnet"
      resource_group_name  = "example-resources"
      virtual_network_name = "prepodvnet"
      address_prefixes     = ["10.0.0.32/27"]
    }
}

nic = {
  nic1 ={
     name     = "frontendvm1-nic"
     location = "West Europe"
     resource_group_name = "example-resources"
     subnetname = "fontendsubnet"
     virtual_network_name = "prepodvnet"

    }
}

nsg ={
  nsg1={
   name = "prepodnsg"
   location = "West Europe"
   resource_group_name = "example-resources"
   nic-name    = "frontendvm1-nic"
}
}

nsg_rule ={
  rule1 ={
  name                        = "RDP"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow" 
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name = "example-resources"
  nsgname = "prepodnsg"

  }  
}

winvm = {
    winvm1={
    nic-name  = "frontendvm1-nic"
    resource_group_name = "example-resources"
    vmname = "frontendvm1"
    location = "West Europe"
    size                = "Standard_F2"
    name = "frontendvm1"
}
}

pip = {
  pip1 ={
  name                = "bastionpip"
  location            = "West Europe"
  resource_group_name = "example-resources"
  allocation_method   = "Static"
  sku                 = "Standard"
} 
  }

bastion = {
  bastion1={
   name                = "jumpbix"
  location            = "West Europe"
  resource_group_name = "example-resources"
  virtual_network_name = "prepodvnet"
  databastion               = "bastionpip"
  datasubnet = "AzureBastionSubnet"
  }
}
