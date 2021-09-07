resource "azurerm_api_management" "apim_instance" {
  name                = var.apim_instance_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  publisher_name      = "Demo-Terraform"
  publisher_email     = var.publisher_email

  sku_name = "Developer_1"
}

resource "azurerm_api_management_api" "apim_api_1" {
  name                = var.apim_api_1_name
  resource_group_name = var.rg_name
  api_management_name = azurerm_api_management.apim_instance.name
  revision            = "1"
  display_name        = "Todo API"
  path                = "api/Todo"
  protocols           = ["https"]
  service_url         = "https://${var.app_service_hostname}/"

}