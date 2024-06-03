
resource "azurerm_mssql_server" "db" {
  name                          = var.db_info.server_name
  resource_group_name           = azurerm_resource_group.ntier_resg.name
  location                      = azurerm_resource_group.ntier_resg.location
  version                       = var.db_info.server_version
  administrator_login           = var.db_info.user_name
  administrator_login_password  = var.db_info.password
  public_network_access_enabled = true

  depends_on = [
    azurerm_resource_group.ntier_resg,
    azurerm_virtual_network.ntier_vnet
  ]
}


resource "azurerm_mssql_database" "db" {
  name        = var.db_info.db_name
  server_id   = azurerm_mssql_server.db.id
  max_size_gb = var.db_info.max_size_gb
  sku_name    = var.db_info.sku_name

  depends_on = [
    azurerm_resource_group.ntier_resg,
    azurerm_mssql_server.db
  ]

}

# resource "azurerm_mssql_server" "mssqlserver" {
#     name = "mymssqlserverfromtf"
#     resource_group_name = azurerm_resource_group.ntier_resg.name
#     location = azurerm_resource_group.ntier_resg.location
#     version = "12.0"
#     administrator_login = "user"
#     administrator_login_password = "my@123@india"
#     public_network_access_enabled = true

#     depends_on = [ 
#         azurerm_resource_group.ntier_resg,
#         azurerm_virtual_network.ntier_vnet
#      ]


# }

# resource "azurerm_mssql_database" "mssqldb" {
#     name = "employee"
#     server_id = azurerm_mssql_server.mssqlserver.id
#     max_size_gb = 2
#     sku_name = "Basic"


# }