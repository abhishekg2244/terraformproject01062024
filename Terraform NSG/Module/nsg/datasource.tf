data "azurerm_network_interface" "datablocknic" {
    for_each = var.nsg
  name                = each.value.nic-name
  resource_group_name = each.value.resource_group_name
}