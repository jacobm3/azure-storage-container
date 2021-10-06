provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "demo" {
  name     = "jmartinson-demo2021"
  location = "centralus"
}

resource "azurerm_storage_account" "demo" {
  name                     = "jmartinsonstoracct"
  resource_group_name      = azurerm_resource_group.demo.name
  location                 = azurerm_resource_group.demo.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = false

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "demo" {
  name                  = "jmartinson-container-01b"
  storage_account_name  = azurerm_storage_account.demo.name
  container_access_type = "container"
}


