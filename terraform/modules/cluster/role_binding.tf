resource "kubernetes_role_binding_v1" "edit" {
  for_each = local.role_bindings

  metadata {
    name      = "${each.value.username}-edit"
    namespace = each.value.namespace
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "edit"
  }

  subject {
    kind      = "User"
    name      = module.users[each.value.username].unique_username
    api_group = "rbac.authorization.k8s.io"
  }
}

resource "kubernetes_cluster_role_binding_v1" "edit" {
  for_each = var.admin_users

  metadata {
    name = "${each.value}-edit"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "edit"
  }

  subject {
    kind      = "User"
    name      = module.users[each.value].unique_username
    api_group = "rbac.authorization.k8s.io"
  }
}
