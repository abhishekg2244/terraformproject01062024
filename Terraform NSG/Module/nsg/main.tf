resource "azurerm_network_security_group" "example" {
    for_each = var.nsg
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}


resource "azurerm_network_interface_security_group_association" "example" {
    for_each = var.nsg
  network_interface_id      = data.azurerm_network_interface.datablocknic[each.key].id
  network_security_group_id = azurerm_network_security_group.example[each.key].id
}