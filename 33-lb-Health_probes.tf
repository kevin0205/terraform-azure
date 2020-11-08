# 33 Add health probe (Load balancer)
# 新增健全狀態探查 (Health probes)
# 在負載平衡器 (Load balancer) 新增健全狀態探查 (Health probes)

# 33-1 Add health probe (http)
resource "azurerm_lb_probe" "http" {
  name                = "amazcLBHTTPProbe"
  loadbalancer_id     = azurerm_lb.lb.id
  resource_group_name = azurerm_resource_group.rg.name
  protocol            = "Http"
  port                = 80
  request_path        = "/"
}

# 33-2 Add health probe (https)
resource "azurerm_lb_probe" "https" {
  name                = "amazicLBHTTPSProbe"
  loadbalancer_id     = azurerm_lb.lb.id
  resource_group_name = azurerm_resource_group.rg.name
  protocol            = "Https"
  port                = 443
  request_path        = "/"
}

# 33-3 Add health probe (SSH)
resource "azurerm_lb_probe" "SSH" {
  name                = "ssh-running-probe"
  loadbalancer_id     = azurerm_lb.lb.id
  resource_group_name = azurerm_resource_group.rg.name
  port                = "22"
  #port                = var.application_port
}
