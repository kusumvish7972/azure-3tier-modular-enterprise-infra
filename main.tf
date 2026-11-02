locals {
  common_tags = merge(var.tags, {
    Architecture = "3-Tier-Enterprise"
    Environment  = var.environment
    ManagedBy    = "Terraform"
  })
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.project_name}-${var.environment}"
  location = var.location
  tags     = local.common_tags
}

# 1. Child Module: 3-Tier Network (3 Subnets & 3 NSGs with micro-segmentation)
module "networking" {
  source              = "./modules/networking"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vnet_address_space  = var.vnet_address_space
  tiers               = var.tier_definitions
  tags                = local.common_tags
}

# 2. Child Module: 3-Tier Compute (3 VMs, 3 NICs, 3 OS Disks generated via for_each)
module "compute" {
  source              = "./modules/compute"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tiers               = var.tier_definitions
  subnet_ids          = module.networking.subnet_ids
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  tags                = local.common_tags
}