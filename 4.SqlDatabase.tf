#15 & 16, Modules & Parameters
#Video 13
# Azure SQL Server
resource "azurerm_sql_server" "example" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = var.admin_login
  administrator_login_password = var.admin_password

  tags = {
    environment = "Test"
  }
   #Define timeouts
  timeouts {
    create = "4m"  # Timeout for resource creation
  }
}
#Video 13
# Azure SQL Database
resource "azurerm_sql_database" "example" {
  name                = var.sql_database_name
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  server_name         = azurerm_sql_server.example.name
  edition             = "Standard"
  collation           = "SQL_Latin1_General_CP1_CI_AS"


  tags = {
    environment = "Test"
  }
  timeouts {
    create = "5m"  # Timeout for resource creation
  }
}
#Video 14
# SQL Server Firewall Rule
resource "azurerm_sql_firewall_rule" "example" {
  name                = var.firewall_rule_name
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_sql_server.example.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}