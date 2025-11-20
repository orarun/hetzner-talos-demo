// outputs.tf
output "talos_config" {
  description = "Talos client configuration (talosconfig)"
  value       = module.talos_cluster.talosconfig
  sensitive   = true
}

output "kube_config" {
  description = "Kubernetes client configuration (kubeconfig)"
  value       = module.talos_cluster.kubeconfig
  sensitive   = true
}

output "kubeconfig_data" {
  description = "Structured kubeconfig data to supply to other providers"
  value       = module.talos_cluster.kubeconfig_data
  sensitive   = true
}

