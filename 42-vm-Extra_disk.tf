# 42 Create and attach a disk (Extra Data disks)
# 建立資料磁碟 (Data disks)
resource "azurerm_managed_disk" "disk" {
  count                = var.num
  name                 = "datadisk_existing-${count.index}"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_type = lookup(var.managed_disk_type, var.region, var.disk_type)
  create_option        = "Empty"
  disk_size_gb         = "1"
  tags = var.tags
}

