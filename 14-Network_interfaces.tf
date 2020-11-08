# 14 Create network interface
# 建立網路介面 (Network interface)
resource "azurerm_network_interface" "nic" {
  #name                      = "nic-${var.servername}"
  count                     = var.num
  name                      = "nic-${var.servername}-${count.index}"
  location                  = azurerm_resource_group.rg.location
  resource_group_name       = azurerm_resource_group.rg.name

  # 單一台虛擬機的時候可使用，使用 Load Balancer 要取消設定
  # Connect the Network interface to the Network security group
  # 關聯網路安全性群組 (Network security group)
  #network_security_group_id = azurerm_network_security_group.nsg.id

  tags = var.tags

  ip_configuration {
    name                          = "niccfg-${var.servername}"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "dynamic"
    #public_ip_address_id          = azurerm_public_ip.pip.id
    public_ip_address_id          = element(azurerm_public_ip.pip.*.id, count.index)
  }
}
