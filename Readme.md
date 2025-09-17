# tractor-k8s-tenants

Terraform config to manage tenants in the shared tractor Kubernetes cluster.

## Usage

> [!IMPORTANT]  
> Prerequisites: [OpenTofu](https://opentofu.org/docs/intro/install/) and admin access to the tractor Kubernetes cluster.

To add a new tenant, edit [`terraform/cluster.tf`](./terraform/cluster.tf)

Then run:

```bash
cd terraform
tofu init
tofu apply
tofu output -raw kubeconfig_username > kubeconfig.yaml
```

You can then use the generated `kubeconfig.yaml` to access the tenant's namespace in the cluster.

## Revoking a lost kubeconfig / Creating a new one

If you lose your kubeconfig or want to create a new one, you can do so by tainting the random_string resource in the respective tenant file and re-applying the configuration. This will generate a new kubeconfig for you and make the old one have no access.

```bash
cd terraform
tofu taint "module.cluster.module.users[\"<username>\"].random_string.suffix"
tofu apply
tofu output -raw kubeconfig_username > kubeconfig.yaml
```
