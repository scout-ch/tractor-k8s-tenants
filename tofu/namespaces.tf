module "ns_pbs_pfadi_finder_midata_adapter" {
  source = "./modules/namespace"

  name          = "pbs-pfadi-finder-midata-adapter"
  instance_pool = "pck-2tvwejg-pne"

  users = {
    "floh-pfadi-finder-midata-adapter" = module.u_floh.unique_username
  }

  providers = {
    kubernetes = kubernetes.kubernetes-production
  }
}
