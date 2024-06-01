data "azurerm_public_ip" "datapip" {
    for_each = var.bastion
    name = each.value.databastion 
    resource_group_name = each.value.resource_group_name

}

data "azurerm_subnet" "datasubnet" {
   
   for_each = var.bastion
   name = each.value.datasubnet 
   virtual_network_name = each.value.virtual_network_name
   resource_group_name = each.value.resource_group_name
}
