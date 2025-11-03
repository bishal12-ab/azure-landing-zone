resource "azurerm_sql_server" "sql_server_blk" {
  for_each                     = var.sql_server
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
}
resource "azurerm_sql_database" "example" {
  for_each = var.sql_server
  name                = each.value.db_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  server_name         = azurerm_sql_server.sql_server_blk["sqlserver1"].name

  # extended_auditing_policy {
  #   storage_endpoint                        = azurerm_storage_account.example.primary_blob_endpoint
  #   storage_account_access_key              = azurerm_storage_account.example.primary_access_key
  #   storage_account_access_key_is_secondary = true
  #   retention_in_days                       = 6
  # }



  # tags = {
  #   environment = "production"
  # }
}