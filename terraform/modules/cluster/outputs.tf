output "kubeconfigs" {
  value = { for key, value in module.users : key => value.kubeconfig }
}
