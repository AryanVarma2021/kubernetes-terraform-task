resource "azurerm_container_group" "container_group" {

  name                = var.azure_conatiner_instance_name
  resource_group_name = var.resource_group
  location            = var.location

  os_type = "Linux"


  sku             = var.sku_name
  ip_address_type = "Public"
  dns_name_label  = var.dns_name_label




  image_registry_credential {

    server   = var.image_registry_server
    username = var.image_registry_username
    password = var.image_resgistry_password

  }


  dynamic "container" {

    for_each = var.container_conf

    content {
      name   = container.value.name
      image  = container.value.image
      cpu    = container.value.cpu
      memory = container.value.memory

      ports {
        port     = container.value.port
        protocol = "TCP"
      }

      environment_variables        = container.value.environment_variables
      secure_environment_variables = container.value.secure_environment_variables
    }

  }







  tags = var.tags
}