# 32 Add backend pool (Load balancer)
# 新增後端集區 (Backend pools)
# 在負載平衡器 (Load balancer) 新增後端集區 (Backend pools)
resource "azurerm_lb_backend_address_pool" "bpepool" {
  name                = "BackEndAddressPool"
  loadbalancer_id     = azurerm_lb.lb.id
  resource_group_name = azurerm_resource_group.rg.name
}

# 32-1 Create backend pools Connect to the virtual machine
# 在負載平衡器 (Load balancer) 的後端集區 (Backend pools) 新增連接虛擬機 (Virtual machine)
resource "azurerm_network_interface_backend_address_pool_association" "nic-asso-bpepool" {
  count                     = var.num
  network_interface_id      = azurerm_network_interface.nic.*.id[count.index]
  #network_interface_id      = element(azurerm_network_interface.nic.*.id, count.index)
  ip_configuration_name   = "niccfg-${var.servername}"
  backend_address_pool_id = azurerm_lb_backend_address_pool.bpepool.id
}
