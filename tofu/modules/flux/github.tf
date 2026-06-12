/*resource "github_repository" "this" {
  name        = var.github_repository.name
  description = var.github_repository.name
  visibility  = "public"
  auto_init   = true # This is extremely important as flux_bootstrap_git will not work without a repository that has been initialised

  topics = [
    "tractor",
  ]

  lifecycle {
    enabled = var.github_repository.name != null
  }
}
*/
data "github_repository" "this" {
  full_name = var.github_repository.full_name

  lifecycle {
    enabled = var.github_repository.full_name != null
  }
}


resource "tls_private_key" "flux" {
  algorithm = "ED25519"
}

resource "github_repository_deploy_key" "this" {
  title      = "Flux"
  repository = local.github_repository.name
  key        = tls_private_key.flux.public_key_openssh
  read_only  = "false"
}

resource "github_repository_file" "tenants" {
  repository = local.github_repository.name
  file       = "${local.cluster_config_path}/tenants.yaml"
  content = templatefile("${path.module}/resources/tenants.tftpl", {
    cluster_name = var.cluster_name
  })
}

resource "github_repository_file" "tenants_folder" {
  repository = local.github_repository.name
  file       = "tenants/${var.cluster_name}/.gitkeep"
  content    = ""
}

resource "github_repository_file" "webhook_ingress" {
  for_each = local.webhook_ingress_manifest != null ? { "this" = local.webhook_ingress_manifest } : {}

  repository = local.github_repository.name
  file       = "${local.cluster_config_path}/webhook-ingress.yaml"
  content    = each.value

  depends_on = [
    github_repository_file.tenants,
  ]
}
