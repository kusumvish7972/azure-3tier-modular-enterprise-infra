output "vm_private_ips" {
  value = { for k, v in azurerm_network_interface.nics : k => v.private_ip_address }
}

output "web_public_ip" {
  value = azurerm_public_ip.web_pip.ip_address
}