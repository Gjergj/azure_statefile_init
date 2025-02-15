output "sas_container_query_string" {
  value     = data.azurerm_storage_account_blob_container_sas.container-sas.sas
  sensitive = true
}

output "sas_storage_query_string" {
  value     = data.azurerm_storage_account_sas.storage-sas.sas
  sensitive = true
}

output "storage_account_name" {
  value = azurerm_storage_account.remotestatestorage.name
}

output "storage_account_primary_connection_string" {
  value = azurerm_storage_account.remotestatestorage.primary_connection_string
}

output "storage_account_primary_access_key" {
  value = azurerm_storage_account.remotestatestorage.primary_access_key
}

output "remotestate_container_name" {
  value = azurerm_storage_container.remotestate-container.name
}
