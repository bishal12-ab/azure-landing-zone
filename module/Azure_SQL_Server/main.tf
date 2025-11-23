resource "azurerm_mssql_server" "sql_server" {
  for_each = var.sql_server
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
  minimum_tls_version          = each.value.minimum_tls_version
  version                      = each.value.version

  
}
resource "azurerm_mssql_database" "sql_db" {
depends_on = [azurerm_mssql_server.sql_server ]
  for_each     = var.sql_server
  name         = each.value.database_name
  server_id    = azurerm_mssql_server.sql_server[ each.key ].id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = each.value.max_size_gb
  sku_name     = "S0"
  enclave_type = "VBS" 

  
}
