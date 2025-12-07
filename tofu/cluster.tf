module "flux" {
  source = "./modules/flux"

  cluster_name         = local.cluster_name
  github_repository    = local.cluster_name
  webhook_ingress_host = local.cluster_webhook_host
}

module "traefik" {
  source = "./modules/traefik"

  cluster_config_repository = module.flux.config_repository
  instance_pool             = "pck-8kxhclv-pdp"
}
