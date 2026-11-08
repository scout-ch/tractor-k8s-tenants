resource "github_repository_file" "this" {
  repository = var.github_repository
  file       = "infrastructure/prometheus/prometheus.yaml"
  content    = file("${path.module}/resources/prometheus.yaml")
}
