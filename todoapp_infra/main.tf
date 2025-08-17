module "resource_group" {
  source                  = "../modules/azurerm_resource_group"
  resource_group_name     = "rg-todoApp"
  resource_group_location = "UK South"
}

module "virtual_network" {
  depends_on               = [module.resource_group]
  source                   = "../modules/azurerm_virtual_network"
  virtual_network_name     = "vnet-todoApp"
  virtual_network_location = "UK South"
  resource_group_name      = "rg-todoApp"
  address_space            = ["10.0.0.0/16"]
}

//as  we are not using for each we will have to call modules twice fro frontend subnet and backend subnet respectively
module "frontend-subnet" {
  depends_on           = [module.virtual_network]
  source               = "../modules/azurerm_subnet"
  subnet_name          = "subnet-frontend-todoApp"
  resource_group_name  = "rg-todoApp"
  virtual_network_name = "vnet-todoApp"
  address_prefixes     = ["10.0.1.0/24"]
}

module "backend-subnet" {
  depends_on           = [module.virtual_network]
  source               = "../modules/azurerm_subnet"
  subnet_name          = "subnet-backend-todoApp"
  resource_group_name  = "rg-todoApp"
  virtual_network_name = "vnet-todoApp"
  address_prefixes     = ["10.0.2.0/24"]
}
module "public_ip_frontend" {
  source              = "../modules/azurerm_public_ip"
  ip_name             = "frontend-pip"
  resource_group_name = "rg-todoApp"
  ip_location         = "UK South"
  allocation_method   = "Static"
}

module "frontend_vm" {
  depends_on          = [module.frontend-subnet, module.public_ip_frontend]
  source              = "../modules/azurerm_virtual_machine"
  nic_name            = "nic-frontend"
  resource_group_name = "rg-todoApp"
  location            = "UK South"
  vm_name             = "frontend-vm"
  vm_size             = "Standard_F2"
  username            = "devopsadmin"
  password            = "devops@12345"
  image_publisher     = "Canonical"
  image_offer         = "0001-com-ubuntu-server-jammy"
  image_sku           = "22_04-lts"
  image_version       = "latest"
  subnet              = "subnet-frontend-todoApp"
  vnet_name           = "vnet-todoApp"
  pip                 = "frontend-pip"

}

module "public_ip_backend" {
  source              = "../modules/azurerm_public_ip"
  ip_name             = "backend-pip"
  resource_group_name = "rg-todoApp"
  ip_location         = "UK South"
  allocation_method   = "Static"
}

module "backend_vm" {
  depends_on          = [module.frontend-subnet, module.public_ip_backend]
  source              = "../modules/azurerm_virtual_machine"
  nic_name            = "nic-backend"
  resource_group_name = "rg-todoApp"
  location            = "UK South"
  vm_name             = "backend-vm"
  vm_size             = "Standard_F2"
  username            = "devopsadmin"
  password            = "devops@12345"
  image_publisher     = "Canonical"
  image_offer         = "0001-com-ubuntu-server-focal"
  image_sku           = "20_04-lts"
  image_version       = "latest"
  subnet              = "subnet-backend-todoApp"
  vnet_name           = "vnet-todoApp"
  pip                 = "backend-pip"


}

module "mssql_server" {
  source                       = "../modules/azurerm_sql_server"
  sql_server_name              = "mssqlserver08dk"
  resource_group_name          = "rg-todoApp"
  location                     = "UK South"
  administrator_login          = "devopsadmin"
  administrator_login_password = "devops@12345"
}

module "mssql_database" {
  depends_on          = [module.mssql_server]
  source              = "../modules/azurerm_sql_database"
  mssql_database_name = "infra-db"
  sql_server_name     = "mssqlserver08dk"
  resource_group_name = "rg-todoApp"
}
