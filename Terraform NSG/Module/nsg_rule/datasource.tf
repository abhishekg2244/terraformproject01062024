data "azurerm_network_security_group" "nsgdatablock" {
  for_each = var.nsg_rule
  name = each.value.nsgname
  resource_group_name = each.value.resource_group_name
}