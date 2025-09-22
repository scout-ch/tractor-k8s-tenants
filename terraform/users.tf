module "u_cosinus" {
  source = "./modules/user"

  username          = "cosinus-ragflow"
  default_namespace = "cosinus-ragflow"

  cluster_info = local.cluster_info
}

module "u_clever" {
  source = "./modules/user"

  username          = "clever"
  default_namespace = null

  cluster_info = local.cluster_info
}
