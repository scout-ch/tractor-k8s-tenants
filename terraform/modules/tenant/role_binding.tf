resource "kubernetes_role_binding_v1" "edit" {
  metadata {
    name      = "${var.user_name}-edit"
    namespace = kubernetes_namespace_v1.tenant.metadata[0].name
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "edit"
  }

  subject {
    kind      = "User"
    name      = local.unique_username
    api_group = "rbac.authorization.k8s.io"
  }
}
