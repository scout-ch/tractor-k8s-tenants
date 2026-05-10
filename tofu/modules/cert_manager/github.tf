resource "github_repository_file" "this" {
  repository = var.github_repository
  file       = "infrastructure/cert-manager/cert-manager.yaml"
  content    = file("${path.module}/resources/cert-manager.yaml")
}

resource "github_repository_file" "cluster_issuers" {
  repository = var.github_repository
  file       = "infrastructure/cluster-issuers/cluster-issuers.yaml"
  content    = file("${path.module}/resources/cluster-issuers.yaml")

  depends_on = [github_repository_file.this]
}
