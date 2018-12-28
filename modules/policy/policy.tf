resource "oci_identity_policy" "policy1" {
  name           = "${var.name}"           //"tf-example-policy"
  description    = "${var.description}"    //"policy created by terraform"
  compartment_id = "${var.compartment_id}"

  statements = [
    "Allow service PSM to inspect vcns in compartment ${var.compartment_name}",
    "Allow service PSM to use subnets in compartment ${var.compartment_name}",
    "Allow service PSM to use vnics in compartment ${var.compartment_name}",
    "Allow service PSM to manage security-lists in compartment ${var.compartment_name}"
  ]
}
