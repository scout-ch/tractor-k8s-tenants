module "flux" {
  source = "./modules/flux"

  cluster_name         = local.cluster_name
  github_repository    = local.cluster_name
  webhook_ingress_host = local.cluster_webhook_host
}

module "traefik" {
  source = "./modules/traefik"

  cluster_config_repository = module.flux.config_repository
  cluster_config_path       = module.flux.cluster_config_path
  instance_pool             = "pck-8kxhclv-pdp"
}

module "cert_manager" {
  source = "./modules/cert_manager"

  cluster_config_repository = module.flux.config_repository
  cluster_config_path       = module.flux.cluster_config_path
}
