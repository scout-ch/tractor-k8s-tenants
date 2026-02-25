resource "github_repository_file" "this" {
  repository = var.cluster_config_repository
  file       = "infrastructure/metrics-server/metrics-server.yaml"
  content    = file("${path.module}/resources/metrics-server.yaml")
}

resource "github_repository_file" "kustomization" {
  repository = var.cluster_config_repository
  file       = "${var.cluster_config_path}/infrastructure/metrics-server.yaml"
  content    = file("${path.module}/resources/kustomization.yaml")

  depends_on = [github_repository_file.this]
}
