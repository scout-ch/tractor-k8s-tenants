module "kaas_production" {
  source = "./modules/kaas"

  infomaniak_public_cloud = {
    id         = "2976"
    project_id = "34898"
  }

  cluster = {
    name      = "tractor-k8s-production"
    version   = "1.35"
    pack_name = "dedicated_4"
    region    = "dc3-a"
  }

  cluster_instance_pools = {
    default = {
      min_instances     = 2
      max_instances     = 5
      availability_zone = "dc3-a-10"
    }
  }
}

module "flux_production" {
  source = "./modules/flux"

  cluster_name = "tractor-k8s-production"
  github_repository = {
    full_name = "scout-ch/tractor-k8s-shared"
  }
  webhook_ingress_host = "flux.prod.k8s.tractor.scout.ch"

  providers = {
    flux       = flux.flux-production
    kubernetes = kubernetes.kubernetes-production
  }
}

module "infrastructure_production" {
  source = "./modules/cluster_infrastructure"

  cluster_config_repository = module.flux.config_repository
  cluster_config_path       = module.flux.cluster_config_path
  instance_pool             = "TBD"
  load_balancer_ip          = "TBD"
}
