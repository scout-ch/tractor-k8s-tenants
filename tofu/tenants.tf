module "t_mova_erinnerungsbuch" {
  source = "./modules/tenant"

  tenant_name               = "mova-erinnerungsbuch"
  cluster_config_repository = module.flux.config_repository
  instance_pool             = "pck-8kxhclv-pdp"
  webhook_ingress_host      = local.cluster_webhook_host

  visibility = "public"
}

module "t_pbs_redirector" {
  source = "./modules/tenant"

  tenant_name               = "pbs-redirector"
  cluster_config_repository = module.flux.config_repository
  instance_pool             = "pck-8kxhclv-pdp"
  webhook_ingress_host      = local.cluster_webhook_host

  visibility = "public"
}

module "t_pbs_taiga" {
  source = "./modules/tenant"

  tenant_name                       = "pbs-taiga"
  cluster_config_repository         = module.flux.config_repository
  instance_pool                     = "pck-8kxhclv-pdp"
  webhook_ingress_host              = local.cluster_webhook_host
  tenant_config_repo_kustomize_path = "kubeconfigs"

  visibility = "public"
}

module "t_pbs_matrix" {
  source = "./modules/tenant"

  tenant_name                       = "pbs-matrix"
  cluster_config_repository         = module.flux.config_repository
  instance_pool                     = "pck-8kxhclv-pdp"
  webhook_ingress_host              = local.cluster_webhook_host
  tenant_config_repo_kustomize_path = "fluxcd"

  visibility = "public"
}

module "t_pbs_backstage" {
  source = "./modules/tenant"

  tenant_name                       = "pbs-backstage"
  cluster_config_repository         = module.flux.config_repository
  instance_pool                     = "pck-8kxhclv-pdp"
  webhook_ingress_host              = local.cluster_webhook_host
  tenant_config_repo_kustomize_path = "kubeconfigs"

  visibility = "public"
}
