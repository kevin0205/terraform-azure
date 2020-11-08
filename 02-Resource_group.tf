# 02 Create a resource group
# 建立資源群組 (Resource Group)
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.rg}"
  location = var.region
  tags = var.tags
}
