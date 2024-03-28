variable "param_location" {
  type = string
  default = "Japan East"
  description = "Region"
}

variable "param_subscription_id" {
  type = string
  default = "xxxx"
  description = "Subscription Id"
}

variable "param_resource_group_name" {
  type = string
  default = "m2-sakai-rg"
  description = "Resource Group Name"
}

variable "param_storageAccount_name" {
  type = string
  default = "m2sakaistorageaccount"
  description = "Storage Account Name"
}

variable "param_asp_name" {
  type = string
  default = "m2-sakai-asp"
  description = "App Service Plan Name"
}

variable "param_functions_name" {
  type = string
  default = "m2-sakai-functionapp"
  description = "Functions Name"
}