module "tractor_k8s_shared" {
  source = "./modules/kaas"

  cluster = {
    id = "1618"
  }

  infomaniak_public_cloud = {
    id         = "2976"
    project_id = "36930"
  }
}
