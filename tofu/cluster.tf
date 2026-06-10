module "kaas_production" {
  source = "./modules/kaas"

  infomaniak_public_cloud = {
    id         = "2976"
    project_id = "34898"
  }

  cluster = {
    name      = local.cluster_name
    version   = "1.35"
    pack_name = "dedicated_4"
    region    = "dc3-a"
  }

  cluster_instance_pools = {
    default = {
      flavor_name       = "a1-ram4-disk20-perf1"
      min_instances     = 4
      max_instances     = 4
      availability_zone = "dc3-a-10"
    }
  }
}

module "flux_production" {
  source = "./modules/flux"

  cluster_name = local.cluster_name
  github_repository = {
    full_name = github_repository.flux-config.full_name
  }
  webhook_ingress_host = local.cluster_webhook_host

  providers = {
    flux       = flux.flux-production
    kubernetes = kubernetes.kubernetes-production
  }
}

module "infrastructure_production" {
  source = "./modules/cluster_infrastructure"

  cluster_config_repository = module.flux_production.config_repository
  cluster_config_path       = module.flux_production.cluster_config_path
  cluster_name              = local.cluster_name
  instance_pool             = "pck-2tvwejg-pne"
  load_balancer_ip          = "195.15.199.206"

  velero_infomaniak_backup_location_s3_url = "https://s3.pub2.infomaniak.cloud/"
}
