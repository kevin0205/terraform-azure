# 34 Add load balancing rule
# 新增負載平衡規則 (Load balancing rules)
# 在負載平衡器 (Load balancer) 新增負載平衡規則 (Load balancing rules)

# 34-1 Add load balancing rule (http)
resource "azurerm_lb_rule" "http" {
  name                           = "amazicLBHTTPRule"
  loadbalancer_id                = azurerm_lb.lb.id
  resource_group_name            = azurerm_resource_group.rg.name
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = azurerm_lb.lb.frontend_ip_configuration[0].name
  backend_address_pool_id        = azurerm_lb_backend_address_pool.bpepool.id
  probe_id                       = azurerm_lb_probe.http.id
  depends_on                     = [azurerm_lb_probe.http]
}

# 34-2 Add load balancing rule (https)
#resource "azurerm_lb_rule" "https" {
#  name                           = "amazicLBHTTPSRule"
#  loadbalancer_id                = azurerm_lb.lb.id
#  resource_group_name            = azurerm_resource_group.rg.name
#  protocol                       = "Tcp"
#  frontend_port                  = 443
#  backend_port                   = 443
#  frontend_ip_configuration_name = azurerm_lb.lb.frontend_ip_configuration[0].name
#  backend_address_pool_id        = azurerm_lb_backend_address_pool.bpepool.id
#  probe_id                       = azurerm_lb_probe.https.id
#  depends_on                     = [azurerm_lb_probe.https]
#}
