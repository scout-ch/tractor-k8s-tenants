resource "github_repository" "flux-config" {
  name        = "tractor-k8s-shared"
  description = "tractor-k8s-shared"
  visibility  = "public"
  auto_init   = true # This is extremely important as flux_bootstrap_git will not work without a repository that has been initialised

  topics = [
    "tractor",
  ]
}
