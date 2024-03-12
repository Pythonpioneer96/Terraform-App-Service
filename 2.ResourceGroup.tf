
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    environment = "Test"
  }
  timeouts {
    create = "5m"  # Timeout for resource creation
  }
}
