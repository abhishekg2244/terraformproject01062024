resource "azurerm_bastion_host" "example" {
    for_each = var.bastion
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "bastionconfiguration"
    subnet_id            = data.azurerm_subnet.datasubnet[each.key].id
    public_ip_address_id =data.azurerm_public_ip.datapip[each.key].id
  }
}