variable "app_service_plan_name" {
    type = string
    description = "Name value for the app service plan being created"
}
variable "rg_location" {
    type = string
    description = "Resource Group location"
    default = "West US 2"
}
variable "rg_name" {
    type = string
    description = "Resource Group Name where app service plan and app service are being deployed"
}
variable "app_service_api_name" {
    type = string
    description = "Name used for the API app service"
}

variable "api_github_url" {
    type = string
    description = "Github URL for the API being deployed"
    default = "https://github.com/Azure-Samples/dotnet-core-api"
}

variable "api_github_branch" {
    type = string
    description = "Branch used for deployment"
    default = "main"
}

variable "sku_tier" {
    type = string
    description = "Sku tier for the app service plan"
    default = "Standard"
}

variable "sku_size" {
    type = string
    description = "Sku size for the app service plan"
    default = "S1"
}