# tractor-k8s-tenants

OpenTofu config to manage tenants in the shared tractor Kubernetes cluster.

## Usage

> [!IMPORTANT]  
> Prerequisites:
> - [OpenTofu](https://opentofu.org/docs/intro/install/)
> - admin access to the tractor Kubernetes cluster (defined in your kubeconfig)
> - Github permissions (either set a GITHUB_TOKEN in your shell or use `gh auth login` cli. The PAT should have  read & write on the scout-ch org in the following permissions: `Administration`, `Contents`, `Webhooks`)
> - An Infomaniak API Token (set in env as INFOANIAK_TOKEN, with scopes: `public_cloud`): https://www.infomaniak.com/en/support/faq/2582/add-and-manage-infomaniak-api-tokens

To add a new tenant, add it to `users.tf`, `tenants.tf` and `outputs.tf` accordingly.

Then run:

```bash
cd tofu
tofu init
tofu apply
tofu output -raw kubeconfig_<username> > kubeconfig.yaml
```

You can then use the generated `kubeconfig.yaml` to access the tenant's namespace in the cluster.

## Revoking a lost kubeconfig / Creating a new one

If you lose your kubeconfig or want to create a new one, you can do so by tainting the random_string resource in the respective tenant file and re-applying the configuration. This will generate a new kubeconfig for you and make the old one have no access.

```bash
cd tofu
tofu taint "module.u_<username>.random_string.suffix"
tofu apply
tofu output -raw kubeconfig_<username> > kubeconfig.yaml
```

## Tenants

When seting up a tenant, a git repo will be created that gets synced into the cluster automatically using FluxCD.
