variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "tiers" { type = map(any) }
variable "subnet_ids" { type = map(string) }
variable "admin_username" { type = string }
variable "admin_password" { type = string }
variable "tags" { type = map(string); default = {} }