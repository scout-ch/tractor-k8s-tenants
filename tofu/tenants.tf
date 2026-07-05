module "t_mova_erinnerungsbuch" {
  source = "./modules/tenant"

  tenant_name               = "mova-erinnerungsbuch"
  cluster_name              = local.cluster_name
  cluster_config_repository = module.flux_production.config_repository
  instance_pool             = "pck-2tvwejg-pne"
  webhook_ingress_host      = local.cluster_webhook_host

  visibility = "public"

  providers = {
    kubernetes = kubernetes.kubernetes-production
  }
}

module "t_pbs_redirector" {
  source = "./modules/tenant"

  tenant_name               = "pbs-redirector"
  cluster_name              = local.cluster_name
  cluster_config_repository = module.flux_production.config_repository
  instance_pool             = "pck-2tvwejg-pne"
  webhook_ingress_host      = local.cluster_webhook_host

  visibility = "public"

  providers = {
    kubernetes = kubernetes.kubernetes-production
  }
}

module "t_pbs_taiga" {
  source = "./modules/tenant"

  tenant_name                       = "pbs-taiga"
  cluster_name                      = local.cluster_name
  cluster_config_repository         = module.flux_production.config_repository
  instance_pool                     = "pck-2tvwejg-pne"
  webhook_ingress_host              = local.cluster_webhook_host
  tenant_config_repo_kustomize_path = "flux"

  visibility = "public"

  providers = {
    kubernetes = kubernetes.kubernetes-production
  }
}

module "t_pbs_matrix" {
  source = "./modules/tenant"

  tenant_name                       = "pbs-matrix"
  cluster_name                      = local.cluster_name
  cluster_config_repository         = module.flux_production.config_repository
  instance_pool                     = "pck-2tvwejg-pne"
  webhook_ingress_host              = local.cluster_webhook_host
  tenant_config_repo_kustomize_path = "fluxcd"

  visibility = "public"

  providers = {
    kubernetes = kubernetes.kubernetes-production
  }
}

module "t_pbs_backstage" {
  source = "./modules/tenant"

  tenant_name                       = "pbs-backstage"
  cluster_name                      = local.cluster_name
  cluster_config_repository         = module.flux_production.config_repository
  instance_pool                     = "pck-2tvwejg-pne"
  webhook_ingress_host              = local.cluster_webhook_host
  tenant_config_repo_kustomize_path = "kubeconfigs"

  visibility = "public"

  providers = {
    kubernetes = kubernetes.kubernetes-production
  }
}

module "t_cosinus_ragflow" {
  source = "./modules/tenant"

  tenant_name                       = "cosinus-ragflow"
  cluster_name                      = local.cluster_name
  cluster_config_repository         = module.flux_production.config_repository
  instance_pool                     = "pck-2tvwejg-pap"
  webhook_ingress_host              = local.cluster_webhook_host
  tenant_config_repo_kustomize_path = "fluxcd"

  users = {
    "cosinus-ragflow" = module.u_cosinus.unique_username
  }

  visibility = "public"

  providers = {
    kubernetes = kubernetes.kubernetes-production
  }
}

module "t_clever_debug" {
  source = "./modules/tenant"

  tenant_name                       = "clever-debug"
  cluster_name                      = local.cluster_name
  cluster_config_repository         = module.flux_production.config_repository
  instance_pool                     = "pck-2tvwejg-pne"
  webhook_ingress_host              = local.cluster_webhook_host
  tenant_config_repo_kustomize_path = "fluxcd"

  visibility = "private"

  providers = {
    kubernetes = kubernetes.kubernetes-production
  }
}

module "t_pbs_gs_lowcoder" {
  source = "./modules/tenant"

  tenant_name                       = "pbs-gs-lowcoder"
  cluster_name                      = local.cluster_name
  cluster_config_repository         = module.flux_production.config_repository
  instance_pool                     = "pck-2tvwejg-pne"
  webhook_ingress_host              = local.cluster_webhook_host
  tenant_config_repo_kustomize_path = "fluxcd"

  users = {
    "nano-pbs-gs-lowcoder" = module.u_nano.unique_username
  }

  visibility = "private"

  providers = {
    kubernetes = kubernetes.kubernetes-production
  }
}

module "t_pbs_who_is_who" {
  source = "./modules/tenant"

  tenant_name               = "pbs-who-is-who"
  cluster_name              = local.cluster_name
  cluster_config_repository = module.flux_production.config_repository
  instance_pool             = "pck-2tvwejg-pne"
  webhook_ingress_host      = local.cluster_webhook_host

  users = {
    "floh-who-is-who" = module.u_floh.unique_username
  }

  providers = {
    kubernetes = kubernetes.kubernetes-production
  }
}