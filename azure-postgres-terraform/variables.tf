variable "location" {
  default = "East US"
}

variable "resource_group_name" {
  default = "rg-postgres-demo"
}

variable "vnet_name" {
  default = "vnet-postgres"
}

variable "subnet_name" {
  default = "snet-postgres"
}

variable "postgresql_server_name" {
  default = "pgflexible-server"
}

variable "postgresql_admin" {
  default = "devuser"
}

variable "postgresql_password" {
  default = "123"
}
