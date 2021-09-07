output "app_service_default_site_hostname" {
    value = module.appservice_api.app_service_default_site_hostname
}

output "apim_gateway_url" {
    value = module.apim_api.apim_gateway_url
}

output "apim_management_api_url" {
    value = module.apim_api.apim_management_api_url
}

output "apim_publisher_portal_url" {
    value = module.apim_api.apim_publisher_portal_url
}

output "apim_developer_portal_url" {
    value = module.apim_api.apim_developer_portal_url
}