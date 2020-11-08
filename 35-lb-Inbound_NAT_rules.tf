# 35 Add inbound NAT rule (Load balancer)
# 新增輸入 NAT 規則 (Inbound NAT rules)
# 在負載平衡器 (Load balancer) 新增輸入 NAT 規則 (Inbound NAT rules)

# 35-1 Add inbound NAT rule (SSHAccess)
resource "azurerm_lb_nat_rule" "lbnetrule-ssh" {
  name                           = "SSHAccess"
  loadbalancer_id                = azurerm_lb.lb.id
  resource_group_name            = azurerm_resource_group.rg.name
  protocol                       = "Tcp"
  frontend_port                  = 22
  backend_port                   = 22
  frontend_ip_configuration_name = azurerm_lb.lb.frontend_ip_configuration[0].name
}

# 單一台虛擬機的時候可使用，多台無法綁定
# 在負載平衡器 (Load balancer) 的輸入 NAT 規則 (Inbound NAT rules) 裡的規則內，新增連接到目標虛擬主機 (Target virtual machine) 和網路 IP 設定 (Network IP configuration)
#resource "azurerm_network_interface_nat_rule_association" "nic-asso-nat-rule-ssh" {
#  count                     = var.num
#  network_interface_id      = azurerm_network_interface.nic.*.id[count.index]
#  #network_interface_id      = element(azurerm_network_interface.nic.*.id, count.index)
#  ip_configuration_name     = "niccfg-${var.servername}"
#  nat_rule_id               = element(azurerm_lb_nat_rule.lbnetrule-ssh.*.id, count.index)
#  depends_on = [azurerm_network_interface.nic , azurerm_lb_nat_rule.lbnetrule-ssh]
#}


# 35-2 Add inbound NAT rule (RDPAccess)
resource "azurerm_lb_nat_rule" "lbnetrule-rdp" {
  name                           = "RDPAccess"
  loadbalancer_id                = azurerm_lb.lb.id
  resource_group_name            = azurerm_resource_group.rg.name
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = azurerm_lb.lb.frontend_ip_configuration[0].name
}

# 單一台虛擬機的時候使用此設定，多台無法綁定
# 在負載平衡器 (Load balancer) 的輸入 NAT 規則 (Inbound NAT rules) 裡的規則內，新增連接到目標虛擬主機 (Target virtual machine) 和網路 IP 設定 (Network IP configuration)
# Connect the Inbound NAT rules to the Target virtual machine & Network IP configuration
#resource "azurerm_network_interface_nat_rule_association" "nic-asso-nat-rule-rdp" {
#  count                     = var.num
#  network_interface_id      = azurerm_network_interface.nic.*.id[count.index]
#  #network_interface_id      = element(azurerm_network_interface.nic.*.id, count.index)
#  ip_configuration_name     = "niccfg-${var.servername}"
#  nat_rule_id               = element(azurerm_lb_nat_rule.lbnetrule-rdp.*.id, count.index)
#  depends_on = [azurerm_network_interface.nic , azurerm_lb_nat_rule.lbnetrule-rdp]
#}
