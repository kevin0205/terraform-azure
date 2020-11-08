# 12 Add subnet
# 在虛擬網路 (Virtual networks) 新增子網路 (Subnet)
resource "azurerm_subnet" "subnet" {
  name                 = "subnet-${var.region}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address_prefixes
}
