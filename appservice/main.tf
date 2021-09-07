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

  storage_account {
    name = "sampleapp_storage_account_content"
    type = "AzureBlob"
    account_name = azurerm_storage_account.sampleapp_storage_account.name
    share_name = azurerm_storage_container.sampleapp_container.name
    access_key = azurerm_key_vault_secret.sampleapp_storage_primary_key.value
  }
}

resource "random_string" "random_storage_name_part" {
  length           = 10
  special          = false
  upper            = false
}

resource "azurerm_storage_account" "sampleapp_storage_account" {
  name                     = "stgsecrets${random_string.random_storage_name_part.id}"
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

resource "azurerm_key_vault" "sampleapp_secrets_kv" {
  name                        = "kv-secrets-${random_string.random_keyvault_namepart.id}"
  location                    = var.rg_location
  resource_group_name         = var.rg_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  enabled_for_deployment = true

  sku_name = "standard"    
}

resource "azurerm_storage_container" "sampleapp_container" {
  name                  = "sampleapp_content"
  storage_account_name  = azurerm_storage_account.sampleapp_storage_account.name
  container_access_type = "private"
}

resource "azurerm_key_vault_secret" "sampleapp_storage_primary_key" {
  name         = "sampleapp-storage-primary-key"
  value        = azurerm_stroage_account.sampleapp_storage_account.primary_access_key
  key_vault_id = azurerm_key_vault.sampleapp_secrets_kv.id
}