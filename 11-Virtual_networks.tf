# 11 Create virtual networks
# 建立虛擬網路 (Virtual networks)
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.region}"
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = var.tags
}
