variable "resource_group_name" {
  description = "Name of the resource group where Public ip is created"
  type        = string
}
variable "ip_name" {
  description = "Name of the Public ip"
  type        = string
}
variable "ip_location" {
  description = "Location of the Public ip"
  type        = string
}
variable "allocation_method" {
  description = "Allocation method of the Public ip"
  type        = string
}