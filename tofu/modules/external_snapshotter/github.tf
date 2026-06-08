resource "github_repository_file" "this" {
  repository = var.github_repository
  file       = "infrastructure/external-snapshotter/external-snapshotter.yaml"
  content    = file("${path.module}/resources/external-snapshotter.yaml")
}

resource "github_repository_file" "volume_snapshot_class" {
  repository = var.github_repository
  file       = "infrastructure/volume-snapshot-class/volume-snapshot-class.yaml"
  content    = file("${path.module}/resources/volume-snapshot-class.yaml")

  depends_on = [github_repository_file.this]
}
