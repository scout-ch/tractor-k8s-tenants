module "cluster" {
  source = "./modules/cluster"

  users = {
    "cosinus-ragflow" = {
      default_namespace = "cosinus-ragflow"
      namespaces = [
        "cosinus-ragflow",
      ]
    }
  }

  admin_users = [
    "clever",
  ]

  additional_namespaces = [
    "pbs-taiga",
  ]

  cluster_info = {
    name     = "pck-8kxhclv"
    endpoint = "https://83.166.143.133:30566"
    ca       = file("./ca.crt")
  }

  namespace_configs = {
    "cosinus-ragflow" = { instance_pool = "pck-8kxhclv-pfb" }
    "pbs-taiga"       = { instance_pool = "pck-8kxhclv-pdp" }
  }
}

output "kubeconfig_clever" {
  value     = module.cluster.kubeconfigs["clever"]
  sensitive = true
}

output "kubeconfig_cosinus" {
  value     = module.cluster.kubeconfigs["cosinus-ragflow"]
  sensitive = true
}
