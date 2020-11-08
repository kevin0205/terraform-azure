# 31 Create load balancer
# 建立負載平衡器 (Load balancers)
resource "azurerm_lb" "lb" {
  name                = "loadBalancer"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = var.sku
  tags                = var.tags

  # 前端 IP 設定 (Frontend IP configuration)
  frontend_ip_configuration {
    name                 = "lbpip-${var.servername}-${var.region}"
    public_ip_address_id = azurerm_public_ip.lbpip.id
  }
}
