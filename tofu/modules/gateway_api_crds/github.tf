resource "github_repository_file" "this" {
  repository = var.github_repository
  file       = "infrastructure/gateway-api-crds/gateway-api-crds.yaml"
  content    = file("${path.module}/resources/gateway-api-crds.yaml")
}
