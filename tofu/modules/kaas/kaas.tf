data "infomaniak_kaas" "cluster" {
  id                      = var.cluster.id
  public_cloud_id         = var.infomaniak_public_cloud.id
  public_cloud_project_id = var.infomaniak_public_cloud.project_id
}
