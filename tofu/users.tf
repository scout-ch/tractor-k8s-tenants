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

module "u_filou" {
  source = "./modules/user"

  username          = "filou"
  default_namespace = null

  cluster_info = local.cluster_info
}

module "u_floh" {
  source = "./modules/user"

  username          = "floh"
  default_namespace = "pbs-who-is-who"

  cluster_info = local.cluster_info
}
