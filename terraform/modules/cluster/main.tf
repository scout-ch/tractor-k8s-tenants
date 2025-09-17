locals {
  combined_users = merge(
    {
      for username, config in var.users : username => {
        default_namespace = config.default_namespace
      }
    },
    {
      for username in var.admin_users : username => {
        default_namespace = null
      }
    },
  )

  namespaces = {
    for namespace in setunion(flatten([for tenant in var.users : tenant.namespaces]), var.additional_namespaces) : namespace => {
      name          = namespace
      instance_pool = try(var.namespace_configs[namespace].instance_pool, null)
    }
  }

  role_bindings = {
    for role_binding in flatten(
      [
        for username, tenant in var.users : [
          for namespace in tenant.namespaces : {
            username  = username,
            namespace = namespace,
          }
        ]
      ]
    ) : "${role_binding.username}-${role_binding.namespace}" => role_binding
  }
}
