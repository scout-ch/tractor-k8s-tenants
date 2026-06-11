module "flux" {
  source = "./modules/flux"

  cluster_name = "tractor-k8s-shared"
  github_repository = {
    full_name = github_repository.flux-config.full_name
  }
  webhook_ingress_host = "flux.old.k8s.tractor.scout.ch"
}

module "backup_storage" {
  source      = "./modules/backup-storage"
  bucket_name = "tractor-k8s-shared"
}

module "infrastructure" {
  source = "./modules/cluster_infrastructure"

  cluster_config_repository = module.flux.config_repository
  cluster_config_path       = module.flux.cluster_config_path
  cluster_name              = "tractor-k8s-shared"
  instance_pool             = "pck-8kxhclv-pdp"
  load_balancer_ip          = "37.156.40.230"

  velero_infomaniak_backup_location = {
    s3_url         = "https://s3.pub2.infomaniak.cloud/"
    s3_credentials = module.backup_storage.credentials
  }
}
