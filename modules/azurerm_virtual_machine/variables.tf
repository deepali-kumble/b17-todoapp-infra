variable "nic_name" {
  description = "Name of the network interface"
  type        = string
}

variable "resource_group_name" {
  description = "resource group of the VM"
  type        = string
}
variable "location" {
  description = "Location of NIC"
  type        = string
}
# variable "subnet_id" {
#   description = "id of frontend subnet"
#   type        = string
# }

variable "vm_name" {
  description = "name of the virtual machine"
  type        = string

}
variable "username" {
  description = "userneme to vm"
  type        = string
}
variable "password" {
  description = "password to vm"
  type        = string
}
variable "vm_size" {
  description = "size of the VM"
  type        = string

}

variable "image_publisher" {
  description = "publisher ID of the image"
  type        = string

}
variable "image_offer" {
  description = "product ID of the image"
  type        = string
}
variable "image_sku" {
  description = "plan ID of the image"
  type        = string
}
variable "image_version" {
  description = "version of the image"
  type        = string
}
# variable "pip_id" {
#   description = "id of the public ip"
#   type = string
  
# }

variable "vnet_name" {
  description = "name of vnet"
  type = string
}

variable "subnet" {
   description = "name of backend subnet"
  type = string
}

variable "pip" {
  description = "name of the frontend ip"
  type = string
}