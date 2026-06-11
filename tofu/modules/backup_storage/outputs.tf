output "credentials" {
  description = "S3 access credentials"
  value = {
    access_key    = openstack_identity_ec2_credential_v3.backup_access_key.access
    access_secret = openstack_identity_ec2_credential_v3.backup_access_key.secret
  }
  sensitive = true
}
