# Public IP strictly for the Web Tier
resource "azurerm_public_ip" "web_pip" {
  name                = "pip-web-tier"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}

# 3 Network Interfaces dynamically created via for_each
resource "azurerm_network_interface" "nics" {
  for_each            = var.tiers
  name                = "nic-${each.key}-vm"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_ids[each.key]
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = each.key == "web" ? azurerm_public_ip.web_pip.id : null
  }
}

# 3 Virtual Machines (Web, App, DB) dynamically provisioned via for_each
resource "azurerm_linux_virtual_machine" "vms" {
  for_each                        = var.tiers
  name                            = "vm-${each.key}-tier"
  location                        = var.location
  resource_group_name             = var.resource_group_name
  size                            = each.value.vm_size
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.nics[each.key].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  tags = merge(var.tags, {
    Tier = each.key
  })
}