
output "kubeconfig_clever" {
  value     = module.u_clever.kubeconfig
  sensitive = true
}

output "kubeconfig_cosinus" {
  value     = module.u_cosinus.kubeconfig
  sensitive = true
}

output "kubeconfig_floh" {
  value     = module.u_floh.kubeconfig
  sensitive = true
}
