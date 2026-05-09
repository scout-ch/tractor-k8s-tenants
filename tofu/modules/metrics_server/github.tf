resource "github_repository_file" "this" {
  repository = var.cluster_config_repository
  file       = "infrastructure/metrics-server/metrics-server.yaml"
  content    = file("${path.module}/resources/metrics-server.yaml")
}
