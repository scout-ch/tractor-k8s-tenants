module "flux" {
  source = "./modules/flux"

  cluster_name = local.cluster_name
  github_repository = {
    full_name = github_repository.flux-config.full_name
  }
  webhook_ingress_host = local.cluster_webhook_host
}

module "infrastructure" {
  source = "./modules/cluster_infrastructure"

  cluster_config_repository = module.flux.config_repository
  cluster_config_path       = module.flux.cluster_config_path
  instance_pool             = "pck-8kxhclv-pdp"
  load_balancer_ip          = "37.156.40.230"
}

module "traefik" {
  source = "./modules/traefik"

  github_repository = module.flux.config_repository
}

module "cert_manager" {
  source = "./modules/cert_manager"

  github_repository = module.flux.config_repository
}

module "metrics_server" {
  source = "./modules/metrics_server"

  github_repository = module.flux.config_repository
}
