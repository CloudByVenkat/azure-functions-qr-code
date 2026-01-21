resource "azurerm_resource_group" "day18_rg" {
  name     = "${var.prefix}-day18-rg"
  location = "Canada Central"
}

resource "azurerm_storage_account" "day18_storage_account" {
  name                     = "${var.prefix}storlin"
  resource_group_name      = azurerm_resource_group.day18_rg.name
  location                 = azurerm_resource_group.day18_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "day18_service_plan" {
  name                = "${var.prefix}-day18-service-plan"
  resource_group_name = azurerm_resource_group.day18_rg.name
  location            = azurerm_resource_group.day18_rg.location
  os_type             = "Linux"
  sku_name            = "Y1"
}

resource "azurerm_linux_function_app" "day18_linux_function_app" {
  name                = "${var.prefix}-day18-linux-function-app"
  resource_group_name = azurerm_resource_group.day18_rg.name
  location            = azurerm_resource_group.day18_rg.location

  storage_account_name       = azurerm_storage_account.day18_storage_account.name
  storage_account_access_key = azurerm_storage_account.day18_storage_account.primary_access_key
  service_plan_id            = azurerm_service_plan.day18_service_plan.id
  functions_extension_version = "~4"

  site_config {
    application_stack {
        node_version = "22"
    }
  }
  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME" = "node"
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
}
}