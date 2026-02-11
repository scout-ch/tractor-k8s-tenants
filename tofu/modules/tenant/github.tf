resource "github_repository" "this" {
  name        = local.github_repository_name
  description = "FluxCD config repository for tenant ${var.tenant_name} on shared K8s cluster of Tractor"

  has_discussions = false
  has_issues      = true
  has_projects    = false
  has_wiki        = false

  allow_auto_merge       = true
  allow_merge_commit     = false
  allow_rebase_merge     = true
  allow_squash_merge     = true
  allow_update_branch    = true
  delete_branch_on_merge = true

  squash_merge_commit_title   = "PR_TITLE"
  squash_merge_commit_message = "PR_BODY"

  visibility = var.visibility

  topics = [
    "tractor",
    "k8s-tenant",
  ]
}

// TODO: Bootstrap repo with initial content

resource "tls_private_key" "this" {
  algorithm = "ED25519"
}

resource "github_repository_deploy_key" "this" {
  title      = "Flux"
  repository = github_repository.this.name
  key        = tls_private_key.this.public_key_openssh
  read_only  = "true"
}

resource "github_repository_file" "this" {
  repository = var.cluster_config_repository
  file       = "${local.config_path}/tenant.yaml"
  content = templatefile("${path.module}/resources/tenant.tftpl", {
    tenant_name                       = var.tenant_name
    secret_name                       = local.kubernetes_secret_name
    github_repository_url             = "ssh://git@github.com/${github_repository.this.full_name}.git"
    namespace                         = local.kubernetes_namespace
    default_service_account_name      = local.default_service_account_name
    git_repository_crd_name           = local.git_repository_crd_name
    instance_pool                     = var.instance_pool
    tenant_config_repo_kustomize_path = var.tenant_config_repo_kustomize_path
  })
}
