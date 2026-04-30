data "azurerm_client_config" "current" {}
resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location


  tags = var.tags

}


module "acr" {

  source = "./modules/acr"

  acr_name = local.acr_name
  location = var.location

  resource_group_name = azurerm_resource_group.rg.name
  repo_url            = var.repo_url

  acr_sku = var.acr_sku

  git_pat    = var.git_pat
  image_name = local.image_name



}

module "aci" {

  source = "./modules/aci"


  resource_group                = azurerm_resource_group.rg.name
  azure_conatiner_instance_name = local.aci_container_name
  location                      = var.location
  dns_name_label                = local.aci_dns_label
  sku_name                      = var.aci_sku_name

  container_conf = local.conatiner_config


  image_registry_server    = module.acr.container_registry.login_server
  image_resgistry_password = module.acr.container_registry.admin_password
  image_registry_username  = module.acr.container_registry.admin_username

  tags = var.tags

  depends_on = [module.acr]

}


module "key_vault" {

  source = "./modules/keyvault"

  kv_name        = local.keyvault_name
  resource_group = azurerm_resource_group.rg.name
  location       = var.location
  sku_name       = var.key_vault_sku




  tags = var.tags

}


module "redis" {

  source = "./modules/redis"


  resource_group    = azurerm_resource_group.rg.name
  location          = var.location
  redis_name        = local.redis_name
  redis_hostname    = var.redis_hostname
  redis_primary_key = var.redis_primary_key

  capacity = var.capacity
  family   = var.family
  sku_name = var.redis_sku_name

  keyvault_id = module.key_vault.key_vault_id


  tags = var.tags

  depends_on = [module.key_vault]


}


module "aks" {

  source = "./modules/aks"

  resource_group = azurerm_resource_group.rg.name
  location       = var.location
  aks_name       = local.aks_name
  dns_prefix     = local.aks_name
  tenant_id      = data.azurerm_client_config.current.tenant_id
  acr_id         = module.acr.container_registry.id
  key_vault_id   = module.key_vault.key_vault_id





  depends_on = [module.acr, module.key_vault]
  tags       = var.tags


}

resource "kubectl_manifest" "secret_provider" {
  yaml_body = templatefile("${path.module}/k8s-manifests/secret-provider.yaml.tftpl", {
    aks_kv_access_identity_id  = module.aks.kv_identity_client_id
    kv_name                    = module.key_vault.key_vault_name
    tenant_id                  = data.azurerm_client_config.current.tenant_id
    redis_url_secret_name      = "redis-hostname"
    redis_password_secret_name = "redis-primary-key"
  })

  depends_on = [module.aks, module.redis]
}

resource "kubectl_manifest" "deployment" {
  yaml_body = templatefile("${path.module}/k8s-manifests/deployment.yaml.tftpl", {
    acr_login_server = module.acr.container_registry.login_server
    app_image_name   = local.image_name
    image_tag        = "latest"
  })

  wait_for {
    field {
      key   = "status.availableReplicas"
      value = "1"
    }
  }

  depends_on = [kubectl_manifest.secret_provider, module.acr]
}

resource "kubectl_manifest" "service" {
  yaml_body = file("${path.module}/k8s-manifests/service.yaml")

  wait_for {
    field {
      key        = "status.loadBalancer.ingress.[0].ip"
      value      = "^(\\d+(\\.|$)){4}"
      value_type = "regex"
    }
  }

  depends_on = [kubectl_manifest.deployment]
}

data "kubernetes_service" "app" {
  metadata {
    name      = "redis-flask-app-service"
    namespace = "default"
  }

  depends_on = [kubectl_manifest.service]
}