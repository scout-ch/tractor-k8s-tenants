locals {
  github_repository = {
    name      = /*var.github_repository.name != null ? github_repository.this.name :*/ data.github_repository.this.name
    full_name = /*var.github_repository.name != null ? github_repository.this.full_name :*/ data.github_repository.this.full_name
  }
}
