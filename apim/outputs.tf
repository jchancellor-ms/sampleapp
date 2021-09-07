output "apim_id" {
    value = azurerm_api_management.apim_instance.id
}

output "apim_gateway_url" {
    value = azurerm_api_management.apim_instance.gateway_url
}

output "apim_management_api_url" {
    value = azurerm_api_management.apim_instance.management_api_url
}

output "apim_publisher_portal_url" {
    value = azurerm_api_management.apim_instance.portal_url
}

output "apim_developer_portal_url" {
    value = azurerm_api_management.apim_instance.developer_portal_url
}

