# 51 Output Values
# 輸出值

# 51-1 Output public IP addresse to the Value (Load balancer)
# 輸出 Public IP 地址的值 (Load balancer)
output "lbpip" {
    description = "Public IP Address of Load Balancer"
    #value = azurerm_public_ip.lbpip.ip_address
    value = azurerm_public_ip.lbpip.*.ip_address
}

# 51-2 Output public IP addresse to the Value (Virtual machine)
# 輸出 Public IP 地址的值 (Virtual machine)
output "pip" {
    description = "Public IP Address of Virtual Machine"
    #value = azurerm_public_ip.pip.ip_address
    value = azurerm_public_ip.pip.*.ip_address
}
