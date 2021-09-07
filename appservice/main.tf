resource "azurerm_app_service_plan" "app_service_plan_standard" {
  name                = var.app_service_plan_name
  location            = var.rg_location
  resource_group_name = var.rg_name

  sku {
    tier = var.sku_tier
    size = var.sku_size
  }
}

resource "azurerm_app_service" "app_service_api" {
  name                = var.app_service_api_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan_standard.id

  site_config {
    dotnet_framework_version = "v2.0"
    #scm_type                 = "GitHub" #Terraform errors when this value is set and a repo_url is supplied
  }

  source_control {
      repo_url = var.api_github_url
      branch = var.api_github_branch
      manual_integration = true
  }
}

