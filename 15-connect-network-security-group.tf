# 15 Connect the Network security group

# Connect the Network security group to the subnet
# 網路安全性群組 (Network security group) 關聯至子網路 (Subnet)
resource "azurerm_subnet_network_security_group_association" "subnet-asso-nsg" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# Connect the Network security group to the network interface
# 網路安全性群組 (Network security group) 關聯網路介面 (Network interface)
resource "azurerm_network_interface_security_group_association" "nic-asso-nsg" {
  count                     = var.num
  #network_interface_id      = azurerm_network_interface.nic.id
  network_interface_id      = azurerm_network_interface.nic.*.id[count.index]
  network_security_group_id = azurerm_network_security_group.nsg.id
  depends_on                = [azurerm_network_security_group.nsg, azurerm_network_interface.nic]
}
