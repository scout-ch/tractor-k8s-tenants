resource "github_repository" "flux-config" {
  name        = "tractor-k8s-shared"
  description = "tractor-k8s-shared"
  visibility  = "public"
  auto_init   = true # This is extremely important as flux_bootstrap_git will not work without a repository that has been initialised

  topics = [
    "tractor",
  ]
}

module "gateway_api_crds" {
  source = "./modules/gateway_api_crds"

  github_repository = module.flux_production.config_repository
}

module "traefik" {
  source = "./modules/traefik"

  github_repository = module.flux_production.config_repository
}

module "cert_manager" {
  source = "./modules/cert_manager"

  github_repository = module.flux_production.config_repository
}

module "metrics_server" {
  source = "./modules/metrics_server"

  github_repository = module.flux_production.config_repository
}

module "velero" {
  source = "./modules/velero"

  github_repository = module.flux_production.config_repository
}

module "external_snapshotter" {
  source = "./modules/external_snapshotter"

  github_repository = module.flux_production.config_repository
}
