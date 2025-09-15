module "cosinus-ragflow" {
  source = "./modules/tenant"

  name          = "cosinus-ragflow"
  user_name     = "cosinus-ragflow"
  instance_pool = "pck-8kxhclv-pst"

  cluster_info = {
    name     = local.cluster_name
    endpoint = local.cluster_endpoint
    ca       = local.cluster_ca
  }
}

output "cosinus_ragflow_kubeconfig" {
  value     = module.cosinus-ragflow.kubeconfig
  sensitive = true
}
