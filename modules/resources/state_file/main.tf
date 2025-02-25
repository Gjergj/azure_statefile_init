

resource "azurerm_resource_group" "state_rg" {
  name     = local.state_resourcegroupname
  location = var.location
  tags = {
    environment = var.environment
  }
}

resource "azurerm_storage_account" "remotestatestorage" {
  name                            = "${var.account_name}state${var.environment}"
  resource_group_name             = azurerm_resource_group.state_rg.name
  location                        = azurerm_resource_group.state_rg.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  https_traffic_only_enabled      = true
  allow_nested_items_to_be_public = false
  public_network_access_enabled   = false
  min_tls_version                 = "TLS1_2"
  # account_replication_type = "GRS"
  tags = {
    environment = var.environment
  }
}

resource "azurerm_storage_container" "remotestate-container" {
  name                  = "sc-${var.environment}-statefiles"
  storage_account_id    = azurerm_storage_account.remotestatestorage.id
  container_access_type = "private"
}

data "azurerm_storage_account_sas" "storage-sas" {
  connection_string = azurerm_storage_account.remotestatestorage.primary_connection_string
  https_only        = true

  start  = "2024-12-25"
  expiry = "2025-03-20"

  services {
    blob  = true
    queue = false
    table = false
    file  = false
  }

  resource_types {
    service   = true
    container = true
    object    = true
  }

  permissions {
    read    = true
    write   = true
    delete  = true
    list    = true
    add     = true
    create  = true
    update  = true
    process = true
    filter  = true
    tag     = true
  }

}

data "azurerm_storage_account_blob_container_sas" "container-sas" {
  connection_string = azurerm_storage_account.remotestatestorage.primary_connection_string
  container_name    = azurerm_storage_container.remotestate-container.name
  https_only        = true
  start             = "2020-12-25"
  expiry            = "2031-10-20"
  permissions {
    read   = true
    add    = true
    create = true
    write  = true
    delete = true
    list   = true
  }
  cache_control       = "max-age=5"
  content_disposition = "inline"
  content_encoding    = "deflate"
  content_language    = "en-US"
  content_type        = "application/json"
}
