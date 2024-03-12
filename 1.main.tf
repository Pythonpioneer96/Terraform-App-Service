provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}


# Define variables
variable "resource_group_name" {
  type    = string
  default = "Bicep2TerraformRG"
}

variable "location" {
  type    = string
  default = "East US"
}

variable "sql_server_name" {
  type    = string
  default = "bicep2terraformsqlserver"
}

variable "sql_database_name" {
  type    = string
  default = "my-sql-database"
}

variable "admin_login" {
  type    = string
  default = "sqladmin"
}

variable "admin_password" {
  type    = string
  default = "Password1234!"
}

variable "firewall_rule_name" {
  type    = string
  default = "AllowAzureServices"
}

variable "app_service_name" {
  type    = string
  default = "appservice4Bicep2Terraform"
}

variable "app_service_plan_name" {
  type    = string
  default = "my-app-service-plan"
}


# # Hello world output
# output "hello_world" {
#   value = "Hello World"
# }
