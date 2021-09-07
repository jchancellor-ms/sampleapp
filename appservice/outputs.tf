output "app_service_id" {
    value = azurerm_app_service.app_service_api.id
}

output "app_service_default_site_hostname" {
    value = azurerm_app_service.app_service_api.default_site_hostname
}
