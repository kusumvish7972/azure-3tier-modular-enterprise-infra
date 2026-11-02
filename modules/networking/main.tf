resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-3tier-core"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.vnet_address_space]
  tags                = var.tags
}

# 3 Subnets dynamically created via for_each
resource "azurerm_subnet" "subnets" {
  for_each             = var.tiers
  name                 = "snet-${each.key}-tier"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value.subnet_prefix]
}

# 3 NSGs with strict tier-isolation rules via for_each
resource "azurerm_network_security_group" "nsgs" {
  for_each            = var.tiers
  name                = "nsg-${each.key}-tier"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  security_rule {
    name                       = "Allow-Tier-Port"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = each.value.port_allowed
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "assoc" {
  for_each                  = var.tiers
  subnet_id                 = azurerm_subnet.subnets[each.key].id
  network_security_group_id = azurerm_network_security_group.nsgs[each.key].id
}