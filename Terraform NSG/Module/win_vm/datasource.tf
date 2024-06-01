data "azurerm_network_interface" "datablocknic" {
    for_each = var.winvm
  name                = each.value.nic-name
  resource_group_name = each.value.resource_group_name
}