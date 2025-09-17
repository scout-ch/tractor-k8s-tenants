module "namespaces" {
  source = "../namespace"

  for_each = local.namespaces

  name = each.value.name

  instance_pool = each.value.instance_pool
}
