variable "subnet_name" {
  description = "name of the subnet"
  type        = string
}

variable "resource_group_name" {
  description = "name of the resource group in which subnet will be created"
  type        = string
}

variable "virtual_network_name" {
  description = "name of the virtual network in which subnet will be created"
  type        = string
}

variable "address_prefixes" {
  description = "address prefixes of the subnet"
  type        = list(string)
}