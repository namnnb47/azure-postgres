resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_postgresql_flexible_server" "postgres" {
  name                   = var.postgresql_server_name
  resource_group_name    = azurerm_resource_group.rg.name
  location               = var.location
  administrator_login    = var.postgresql_admin
  administrator_password = var.postgresql_password
  version                = "13"

  storage_mb = 32768
  sku_name   = "GP_Standard_D2s_v3"

#   delegated_subnet_id           = azurerm_subnet.subnet.id
  public_network_access_enabled = true

  #   private_dns_zone_id    = null



  #   high_availability {
  #     mode = "Disabled"
  #   }

  authentication {
    active_directory_auth_enabled = false
    password_auth_enabled         = true
  }


  lifecycle {
    ignore_changes = [
      zone
    ]
  }
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_all" {
  name             = "AllowAll"
  server_id        = azurerm_postgresql_flexible_server.postgres.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "255.255.255.255"
}
