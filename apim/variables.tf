variable "apim_instance_name" {
    type = string
    description = "Name value for the Api Management instance being created"
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

variable "publisher_email" {
    type = string
    description = "Email address for the publisher field in API management"
}
variable "apim_api_1_name" {
    type = string
    description = "Name used for the first API defined in the APIM instance"
}

variable "app_service_hostname" {
    type = string
    description = "hostname reference from the app service hosting the api"
}
