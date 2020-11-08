# 21 Create public IP address
# 建立公用 IP 位址 (Public IP addresses)

# 21-1-1 Create random FQDN DNS prefix name (Load balancer)
# 建立隨機產生 6 位數的 FQDN DNS 前綴名稱 (Load balancer)
resource "random_string" "fqdn" {
  length  = 6
  special = false
  upper   = false
  number  = false
}

# 21-1-2 Create public IP address Connect to the Load balancer
# 建立公用 IP 位址 (Public IP addresses) 關聯至負載平衡器 (Load balancer)
resource "azurerm_public_ip" "lbpip" {
  name                = "lbpip-${var.servername}-${var.region}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = var.sku
  domain_name_label   = random_string.fqdn.result
  tags = var.tags
}

# 21-2 Create public IP address Connect to the Virtual machine
# 建立公用 IP 位址 (Public IP addresses) 關聯至虛擬機器 (Virtual machine)
resource "azurerm_public_ip" "pip" {
  count               = var.num
  name                = "pip-${var.servername}-${var.region}-${count.index}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = var.sku
  #domain_name_label   = random_string.fqdn.result
  tags = var.tags
}
