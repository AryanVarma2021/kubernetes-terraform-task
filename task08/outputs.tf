output "aci_fqdn" {

  description = "The fully qualified domain name (FQDN) of the Azure Container Instance"
  value       = module.aci.container_group.fqdn

}

output "aks_lb_ip" {

  description = "The public IP address of the Azure Kubernetes Service (AKS) load balancer"
  value       = data.kubernetes_service.app.status[0].load_balancer[0].ingress[0].ip

}