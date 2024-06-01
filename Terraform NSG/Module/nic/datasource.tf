data "azurerm_subnet" "subnetdatablock" {
    for_each = var.nic
    name =each.value.subnetname
    resource_group_name = each.value.resource_group_name
    virtual_network_name = each.value.virtual_network_name
}