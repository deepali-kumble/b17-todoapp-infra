variable "virtual_network_name" {
  description = ":name of the Virtual network"
  type        = string
}

variable "virtual_network_location" {
  description = "location of the Virtual network"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the resource group will be created"
  type        = string
}
variable "address_space" {
  description = "The address space for the virtual machine"
  type        = list(string)
}
