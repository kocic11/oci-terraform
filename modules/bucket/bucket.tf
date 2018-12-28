data "oci_objectstorage_namespace" "ns" {}

resource "oci_objectstorage_bucket" "bucket1" {
  compartment_id = "${var.compartment_id}"
  namespace      = "${data.oci_objectstorage_namespace.ns.namespace}"
  name           = "${var.bucket_name}" 
  access_type    = "${var.access_type}" 
}