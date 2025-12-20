resource "github_repository_file" "kustomization" {
  repository = var.cluster_config_repository
  file       = "${var.cluster_config_path}/infrastructure/cert-manager.yaml"
  content    = file("${path.module}/resources/kustomization.yaml")
}

resource "github_repository_file" "this" {
  repository = var.cluster_config_repository
  file       = "infrastructure/cert-manager/cert-manager.yaml"
  content    = file("${path.module}/resources/cert-manager.yaml")
}

resource "github_repository_file" "cluster_issuers" {
  repository = var.cluster_config_repository
  file       = "infrastructure/cluster-issuers/cluster-issuers.yaml"
  content    = file("${path.module}/resources/cluster-issuers.yaml")
}
