resource "github_repository_file" "this" {
  repository = var.cluster_config_repository
  file       = "infrastructure/controllers/cert-manager.yaml"
  content    = file("${path.module}/resources/cert-manager.yaml")
}

resource "github_repository_file" "this" {
  repository = var.cluster_config_repository
  file       = "infrastructure/crds/cluster-issuers.yaml"
  content    = file("${path.module}/resources/cluster-issuers.yaml")
}
