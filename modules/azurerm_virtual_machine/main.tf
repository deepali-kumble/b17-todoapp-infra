

data "azurerm_subnet" "subnet" {
  name                 = var.subnet
  virtual_network_name =  var.vnet_name
  resource_group_name  =  var.resource_group_name
}
data "azurerm_subnet" "backend-subnet" {
  name                 =  var.subnet
  virtual_network_name =  var.vnet_name
  resource_group_name  = var.resource_group_name
}

data "azurerm_public_ip" "pip" {
  name                = var.pip
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet.id
    public_ip_address_id = data.azurerm_public_ip.pip.id
    private_ip_address_allocation = "Dynamic"
  }
}

# resource "azurerm_public_ip" "pip" {
#   name                = "infra-pip"
#   resource_group_name = "rg-todoApp"
#   location            = "central-india"
#   allocation_method   = "Static"
# }

resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.username
  admin_password      = var.password
  disable_password_authentication = false

  //nic implicit dependency
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  #   admin_ssh_key {
  #     username   = "adminuser"
  #     public_key = file("~/.ssh/id_rsa.pub")
  #   }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher #publisher id og the image
    offer     = var.image_offer     #product ID of the image"
    sku       = var.image_sku       #plan id of image
    version   = var.image_version   # version of the image
  }
}
