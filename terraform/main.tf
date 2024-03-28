resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.param_storageAccount_name}"
  resource_group_name      = "${var.param_resource_group_name}"
  location                 = "${var.param_location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "app_service_plan" {
  name                = "${var.param_asp_name}"
  resource_group_name = "${var.param_resource_group_name}"
  location            = "${var.param_location}"
  os_type             = "Windows"
  sku_name            = "B1"
}

resource "azurerm_windows_function_app" "function_app" {
  name                = "${var.param_functions_name}"
  resource_group_name = "${var.param_resource_group_name}"
  location            = "${var.param_location}"

  storage_account_name       = "${var.param_storageAccount_name}"
  storage_account_access_key = azurerm_storage_account.storage_account.primary_access_key
  service_plan_id            = azurerm_service_plan.app_service_plan.id

  site_config {}
}
