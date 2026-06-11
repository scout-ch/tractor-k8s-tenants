resource "github_repository_file" "this" {
  repository = var.github_repository
  file       = "infrastructure/traefik/traefik.yaml"
  content    = file("${path.module}/resources/traefik.yaml")
}

resource "github_repository_file" "crds" {
  repository = var.github_repository
  file       = "infrastructure/traefik-crds/traefik-crds.yaml"
  content    = file("${path.module}/resources/traefik-crds.yaml")
}
