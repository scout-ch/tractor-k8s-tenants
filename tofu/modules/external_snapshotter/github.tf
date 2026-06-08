resource "github_repository_file" "this" {
  repository = var.github_repository
  file       = "infrastructure/external-snapshotter/external-snapshotter.yaml"
  content    = file("${path.module}/resources/external-snapshotter.yaml")
}
