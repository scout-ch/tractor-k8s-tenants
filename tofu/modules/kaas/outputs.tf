
output "k8s_config" {
  description = "The decompose kubeconfig of the managed K8s cluster"
  value       = local.k8s_config
  sensitive   = true
}

output "raw_k8s_config" {
  description = "The raw kubeconfig of the managed K8s cluster"
  value       = data.infomaniak_kaas.cluster.kubeconfig
  sensitive   = true
}

output "cluster_info" {
  description = "Basic information about the managed K8s cluster"
  value       = local.cluster_info
}
