resource "github_repository_file" "this" {
  repository = var.github_repository
  file       = "infrastructure/kyverno/kyverno.yaml"
  content    = file("${path.module}/resources/kyverno.yaml")
}

resource "github_repository_file" "instance_pool_selector_policy" {
  repository = var.github_repository
  file       = "infrastructure/kyverno-policies/instance-pool-selector/instance-pool-selector.yaml"
  content    = file("${path.module}/resources/instance-pool-selector-policy.yaml")
}
