resource "openstack_identity_ec2_credential_v3" "backup_access_key" {}

resource "openstack_objectstorage_container_v1" "container_1" {
  name = var.bucket_name
}
