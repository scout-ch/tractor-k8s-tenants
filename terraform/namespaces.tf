module "ns_cosinus_ragflow" {
  source = "./modules/namespace"

  name          = "cosinus-ragflow"
  instance_pool = "pck-8kxhclv-pfb"

  users = {
    "cosinus-ragflow" = module.u_cosinus.unique_username
  }
}

module "ns_pbs_taiga" {
  source = "./modules/namespace"

  name          = "pbs-taiga"
  instance_pool = "pck-8kxhclv-pdp"
}
