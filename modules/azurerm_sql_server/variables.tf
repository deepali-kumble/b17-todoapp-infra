variable "sql_server_name" {
  description = "Name of the SQL Server"
  type        = string
}
variable "resource_group_name" {
  description = "resource group of SQL server"
  type        = string
}
variable "location" {
  description = "location of the SQL server"
  type        = string
}

variable "administrator_login" {
  description = "adminn username to SQL server"
  type        = string
}
variable "administrator_login_password" {
  description = "adminn password to SQL server"
  type        = string
}
