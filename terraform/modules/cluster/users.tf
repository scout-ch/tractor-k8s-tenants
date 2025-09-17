module "users" {
  source = "../user"

  for_each = local.combined_users

  username          = each.key
  default_namespace = each.value.default_namespace

  cluster_info = var.cluster_info
}
