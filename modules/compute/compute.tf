resource "oci_core_instance" "TFInstance" {
  availability_domain = "${var.availability_domain}"
  compartment_id = "${var.compartment_id}"
  display_name = "${var.display_name}"
  hostname_label = "${var.hostname_label}"
  source_details {
    source_type = "${var.source_type}"
    source_id   = "${var.source_id}"
  }
  shape = "${var.shape}"
  subnet_id = "${var.subnet_id}"
  metadata {
    ssh_authorized_keys = "${var.ssh_public_key}"
  }

  timeouts {
    create = "60m"
  }
}