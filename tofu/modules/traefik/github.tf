resource "github_repository_file" "this" {
  repository = var.github_repository
  file       = "infrastructure/traefik/traefik.yaml"
  content    = file("${path.module}/resources/traefik.yaml")
}
