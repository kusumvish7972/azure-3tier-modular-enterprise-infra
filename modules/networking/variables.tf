variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "vnet_address_space" { type = string }
variable "tiers" { type = map(any) }
variable "tags" { type = map(string); default = {} }