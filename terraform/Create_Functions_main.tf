provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "m2-sakai-rg2"
  location = "Japan East"
}

resource "azurerm_storage_account" "example" {
  name                     = "m2sakaiiac2"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "example" {
  name                = "IaC-Test-ASP2"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  os_type             = "Windows"
  sku_name            = "B1"
}

resource "azurerm_windows_function_app" "example" {
  name                = "IaC-Test-Functions2"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
  service_plan_id            = azurerm_service_plan.example.id

  site_config {}
}