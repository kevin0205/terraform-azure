# 02-Resource_group.tf
rg = "terraformdemo"


# 02-Resource_group.tf
# 11-Virtual_networks.tf
# 12-vnet-Subnets.tf
# 13-Network_security_groups.tf
# 21-Public_IP_addresses.tf
# 31-Load_balancers.tf
# 41-Virtual_machines-linux.tf
# 42-vm-Extra_disk.tf
region = "japaneast"


# 02-Resource_group.tf
# 11-Virtual_networks.tf
# 13-Network_security_groups.tf
# 14-Network_interfaces.tf
# 21-Public_IP_addresses.tf
# 31-Load_balancers.tf
# 41-Virtual_machines-linux.tf
# 42-vm-Extra_disk.tf
#tags = "Dev"
#tags = "Test"
#tags = "Prod"


# 11-Virtual_networks.tf
vnet_address_space = ["10.1.0.0/16"]


# 12-vnet-Subnets.tf
subnet_address_prefixes = ["10.1.1.0/24"]


# 14-Network_interfaces.tf
# 21-Public_IP_addresses.tf
# 41-Virtual_machines-linux.tf
# 42-vm-Extra_disk.tf
num = 1


# 21-Public_IP_addresses.tf
# 31-Load_balancers.tf
sku = "Standard"


# 41-Virtual_machines-linux.tf
vm_size = "Standard_DS1_v2"


# 41-Virtual_machines-linux.tf
os = {
  publisher = "Canonical"
  offer     = "UbuntuServer"
  sku       = "16.04.0-LTS"
  version   = "latest"
}


# 41-Virtual_machines-linux.tf
# 42-vm-Extra_disk.tf
disk_type = "Standard_LRS"
#disk_type = "Premium_LRS"
#disk_type = "StandardSSD_LRS"
#disk_type = "UltraSSD_LRS"


# 14-Network_interfaces.tf
# 21-Public_IP_addresses.tf
# 31-Load_balancers.tf
# 41-Virtual_machines-linux.tf
servername = "vmterraform"


# 41-Virtual_machines-linux.tf
admin_username = "terraadmin"
admin_password = "Password1234!"
