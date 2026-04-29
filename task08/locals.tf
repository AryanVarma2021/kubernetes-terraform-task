locals {
  
  rg_name = join("-", [var.name_prefix, "rg"])
  aci_name = join("-", [var.name_prefix, "ci"])
  acr_name = join("", [var.name_prefix, "cr"])
  aks_name = join("-", [var.name_prefix, "aks"])
  keyvault_name = join("-", [var.name_prefix, "kv"])
  redis_name = join("-", [var.name_prefix, "redis"])
  image_name = join("-", [var.name_prefix, "app"])


  aci_container_name = join("-", [var.name_prefix, "container"])
  aci_dns_label = join("-", [var.name_prefix, "dns"])


  conatiner_config = [

    {
      name = "myapp"
      image = "${module.acr.container_registry.login_server}/${local.image_name}:latest"
      cpu = 0.5
      memory = 1.0
      port = 8080
      environment_variables = {
       "CREATOR" = "ACI"
       "REDIS_PORT" = "6380"
       "REDIS_SSL_MODE" = "true"
      }

      secure_environment_variables = {
        "REDIS_URL" = module.redis.redis_host_name
        "REDIS_PWD" = module.redis.redis_key
      }
    }
  ]
}