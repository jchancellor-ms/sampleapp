variable "rg_location" {
    type = string
    description = "Resource Group location"
    default = "West US 2"
}
variable "rg_name" {
    type = string
    description = "Resource Group Name where app service plan and app service are being deployed"
}

variable "app_service_plan_name" {
    type = string
    description = "Name value for the app service plan being created"
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

variable "apim_instance_name" {
    type = string
    description = "Name value for the Api Management instance being created"
}

variable "publisher_email" {
    type = string
    description = "Email address for the publisher field in API management"
}

variable "apim_api_1_name" {
    type = string
    description = "Name used for the first API defined in the APIM instance"
}

variable "base_tags" {
    type = map(string)
    description = "list of the tags associated with the resource group"
}


