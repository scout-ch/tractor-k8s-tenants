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
    full_name = github_repository.flux-config.full_name
  }
  webhook_ingress_host = "flux.prod.k8s.tractor.scout.ch"

  providers = {
    flux       = flux.flux-production
    kubernetes = kubernetes.kubernetes-production
  }
}

module "infrastructure_production" {
  source = "./modules/cluster_infrastructure"

  cluster_config_repository = module.flux_production.config_repository
  cluster_config_path       = module.flux_production.cluster_config_path
  cluster_name              = "tractor-k8s-production"
  instance_pool             = "pck-2tvwejg-ppy"
  load_balancer_ip          = "195.15.199.206"

  velero_infomaniak_backup_location = {
    region_name                 = "dc4-a"
    auth_url                    = "https://api.pub1.infomaniak.cloud/identity"
    application_credential_name = "tractor-k8s-production-velero"
    os_swift_endpoint_host      = "s3.pub2.infomaniak.cloud"
  }
}
