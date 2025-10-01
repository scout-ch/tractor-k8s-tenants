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

module "ns_pbs_who_is_who" {
  source = "./modules/namespace"

  name          = "pbs-who-is-who"
  instance_pool = "pck-8kxhclv-pdp"
}

module "ns_mova_erinnerungsbuch" {
  source = "./modules/namespace"

  name          = "mova-erinnerungsbuch"
  instance_pool = "pck-8kxhclv-pdp"
}
