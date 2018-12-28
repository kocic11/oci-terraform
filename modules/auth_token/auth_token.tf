resource "oci_identity_auth_token" "auth-token1" {
  #Required
  user_id     = "${var.user_id}"
  description = "${var.description}"
}