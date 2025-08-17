resource "azurerm_public_ip" "pip" {
  name                = var.ip_name
  resource_group_name = var.resource_group_name
  location            = var.ip_location
  allocation_method   = var.allocation_method
}
