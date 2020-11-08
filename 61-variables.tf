# 02-Resource_group.tf
variable "rg" {
  type = string
  description = "Name of the system or environment"
}


# 02-Resource_group.tf
# 11-Virtual_networks.tf
# 12-vnet-Subnets.tf
# 13-Network_security_groups.tf
# 21-Public_IP_addresses.tf
# 31-Load_balancers.tf
# 41-Virtual_machines-linux.tf
# 42-vm-Extra_disk.tf
variable "region" {
  type = string
  description = "Azure location of terraform server environment"

  default = "eastasia"
}


# 02-Resource_group.tf
# 11-Virtual_networks.tf
# 13-Network_security_groups.tf
# 14-Network_interfaces.tf
# 21-Public_IP_addresses.tf
# 31-Load_balancers.tf
# 41-Virtual_machines-linux.tf
# 42-vm-Extra_disk.tf
variable "tags" {
  type = map
  description = "Azure location of terraform server environment"

  default = {
    Environment = "Dev"
    Dept        = "Engineering"
  }
}


# 11-Virtual_networks.tf
variable "vnet_address_space" {
  type = list
  description = "Address space for Virtual Network"

  default = ["10.0.0.0/16"]
}


# 12-vnet-Subnets.tf
variable "subnet_address_prefixes" {
  type = list
  description = "Address prefixes for Subnet"

  default = ["10.0.1.0/24"]
}


# 14-Network_interfaces.tf
# 21-Public_IP_addresses.tf
# 41-Virtual_machines-linux.tf
# 42-vm-Extra_disk.tf
variable "num" {
  default = "1"
}


# 21-Public_IP_addresses.tf
# 31-Load_balancers.tf
variable "sku" {
  type = string
  description = "Size of VM"
  default = "Basic"
}


# 41-Virtual_machines-linux.tf
variable "vm_size" {
  type = string
  description = "Size of VM"

  default = "Standard_B1s"
}


# 41-Virtual_machines-linux.tf
variable "os" {
  description = "OS image to deploy"
  type = object({
      publisher = string
      offer = string
      sku = string
      version = string
  })
}


# 41-Virtual_machines-linux.tf
# 42-vm-Extra_disk.tf
variable "managed_disk_type" {
  type = map
  description = "Disk type Premium in Primary location Standard in DR location"

  default = {
      japaneast = "Premium_LRS"
      eastasia = "Standard_LRS"
  }
}


# 41-Virtual_machines-linux.tf
# 42-vm-Extra_disk.tf
variable "disk_type" {
  type = string
  description = "The type of storage to use for the managed disk"
  default = "Standard_LRS"
}


# 14-Network_interfaces.tf
# 21-Public_IP_addresses.tf
# 31-Load_balancers.tf
# 41-Virtual_machines-linux.tf
variable "servername" {
  type = string
  description = "Server name of the virtual machine"
}


# 41-Virtual_machines-linux.tf
variable "admin_username" {
  type = string
  description = "Administrator user name for virtual machine"
}

variable "admin_password" {
  type = string
  description = "Password must meet Azure complexity requirements"
}
