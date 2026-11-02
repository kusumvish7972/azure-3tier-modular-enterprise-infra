output "vnet_name" {
  value = module.networking.vnet_name
}

output "tier_vm_private_ips" {
  description = "Private IP addresses for each tier VM"
  value       = module.compute.vm_private_ips
}

output "web_public_ip" {
  description = "Public IP for the Web Tier Entrypoint"
  value       = module.compute.web_public_ip
}