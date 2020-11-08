# 41 Create a virtual machine (Linux)
# 建立虛擬機器 (Virtual machine)
resource "azurerm_virtual_machine" "vm" {
  count                 = var.num
  name                  = "${var.servername}-${count.index}"
  location              = azurerm_resource_group.rg.location
  availability_set_id   = azurerm_availability_set.avset.id
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [element(azurerm_network_interface.nic.*.id, count.index)]
  vm_size               = var.vm_size

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = var.os.publisher
    offer     = var.os.offer
    sku       = var.os.sku
    version   = var.os.version
  }

  # OS disk
  storage_os_disk {
    name              = "stvm-${var.servername}-${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = lookup(var.managed_disk_type, var.region, var.disk_type)
  }

  # Data disks
  # Optional data disks
  storage_data_disk {
    name              = "datadisk_new-${count.index}"
    managed_disk_type = var.disk_type
    create_option     = "Empty"
    lun               = 0
    disk_size_gb      = "2"
  }

  # Data disks
  # 42 Create and attach a disk (Extra Data disks)
  storage_data_disk {
    name            = element(azurerm_managed_disk.disk.*.name, count.index)
    managed_disk_id = element(azurerm_managed_disk.disk.*.id, count.index)
    create_option   = "Attach"
    lun             = 1
    disk_size_gb    = element(azurerm_managed_disk.disk.*.disk_size_gb, count.index)
  }

  os_profile {
    #computer_name  = var.servername
    computer_name  = "${var.servername}-${count.index}"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = var.tags
  depends_on = [azurerm_network_interface.nic]
}

# 使用 Load Balancer 要取消設定
#data "azurerm_public_ip" "ip" {
#  name                = azurerm_public_ip.pip.name
#  resource_group_name = azurerm_virtual_machine.vm.resource_group_name
#  depends_on          = [azurerm_virtual_machine.vm]
#}
