variable "project_name" { type = string; default = "threetier" }
variable "environment" { type = string; default = "prod" }
variable "location" { type = string; default = "eastus" }
variable "admin_username" { type = string; default = "azureuser" }
variable "admin_password" { type = string; sensitive = true; default = "SuperP@ssw0rd2026!#" }

variable "vnet_address_space" {
  type    = string
  default = "10.200.0.0/16"
}

variable "tier_definitions" {
  description = "Configuration for the 3 distinct tiers (Web, App, DB) driven by for_each"
  type = map(object({
    subnet_prefix = string
    vm_size       = string
    port_allowed  = string
  }))
  default = {
    "web" = {
      subnet_prefix = "10.200.1.0/24"
      vm_size       = "Standard_B2s"
      port_allowed  = "443"
    }
    "app" = {
      subnet_prefix = "10.200.2.0/24"
      vm_size       = "Standard_D2s_v5"
      port_allowed  = "8080"
    }
    "db" = {
      subnet_prefix = "10.200.3.0/24"
      vm_size       = "Standard_D4s_v5"
      port_allowed  = "1433"
    }
  }
}

variable "tags" {
  type    = map(string)
  default = {}
}