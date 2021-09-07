resource "azurerm_resource_group" "app_rg" {
  name     = var.rg_name
  location = var.rg_location

  tags = var.base_tags
}

module "appservice_api" {
    source = "../appservice"

    #values to create the 
    app_service_plan_name = var.app_service_plan_name
    rg_location = azurerm_resource_group.app_rg.location
    rg_name = azurerm_resource_group.app_rg.name
    app_service_api_name = var.app_service_api_name
    api_github_url = var.api_github_url
    api_github_branch = var.api_github_branch
    sku_tier = var.sku_tier
    sku_size = var.sku_size

    depends_on = [
      azurerm_resource_group.app_rg,
    ]
}

module "apim_api" {
    source = "../apim"

    #values to create the 
    apim_instance_name = var.apim_instance_name
    rg_location = azurerm_resource_group.app_rg.location
    rg_name = azurerm_resource_group.app_rg.name
    publisher_email = var.publisher_email
    apim_api_1_name = var.apim_api_1_name
    app_service_hostname = module.appservice_api.app_service_default_site_hostname

    depends_on = [
      module.appservice_api, azurerm_resource_group.app_rg,
    ]
}