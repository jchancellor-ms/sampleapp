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

resource "random_string" "random_storage_name" {
  length           = 10
  special          = false
  upper            = false
}

resource "azurerm_storage_account" "tfstate_storage_account" {
  name                     = "stgsecrets${random_string.random_storage_part.id}"
  resource_group_name      = var.rg_name
  location                 = var.rg_location
  account_tier             = "Standard"
  account_replication_type = "LRS"  
}

data "azurerm_client_config" "current" {}

resource "random_string" "random_keyvault_namepart" {
  length           = 10
  special          = false
  upper            = false
}

resource "azurerm_key_vault" "tfstate_infra_kv" {
  name                        = "kv-secrets-${random_string.random_keyvault_namepart.id}"
  location                    = var.rg_location
  resource_group_name         = var.rg_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  enabled_for_deployment = true

  sku_name = "standard"    
}