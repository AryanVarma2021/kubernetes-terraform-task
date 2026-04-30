resource "azurerm_container_registry" "acr" {

  name                = var.acr_name
  resource_group_name = var.resource_group_name
  sku                 = var.acr_sku
  location            = var.location


  admin_enabled = true

}


resource "azurerm_container_registry_task" "acr_task" {
  name                  = "${var.acr_name}-task"
  container_registry_id = azurerm_container_registry.acr.id

  platform {
    os = "Linux"
  }


  docker_step {
    dockerfile_path      = "task08/application/Dockerfile"
    context_path         = var.repo_url
    context_access_token = var.git_pat
    image_names          = [var.image_name]




  }


}

resource "azurerm_container_registry_task_schedule_run_now" "run" {
  container_registry_task_id = azurerm_container_registry_task.acr_task.id

}