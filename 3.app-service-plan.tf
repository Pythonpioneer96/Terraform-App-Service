
#15 & 16, Modules & Parameters
#Video 6
#App Service Plan
resource "azurerm_app_service_plan" "example" {
  name                = "app_service_plan_name"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Basic"
    size = "B1"
  }
}



# Video 7
# resource "azurerm_app_service_plan" "example" {
#   name                = "app_service_plan_name"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name

#   sku {
#     tier = "Basic"
#     size = "B1"
#   }

#   kind = "Linux"
# }



#Video 10
# Application Insights
resource "azurerm_application_insights" "example" {
  name                = "app_insights_name"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  application_type = "web"
}




#Video 8
# App Service
resource "azurerm_app_service" "example" {
  depends_on          = [azurerm_app_service_plan.example, azurerm_application_insights.example]
  name                = var.app_service_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    always_on = true
  }

  

#Video 11,12
# App Settings
  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.example.instrumentation_key
    "Key1" = "Value1"
    "Key2" = "Value2"

  }
}