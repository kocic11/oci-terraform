# # Output the result
output "show-ads" {
  value = "${data.oci_identity_availability_domains.ADs.availability_domains}"
}

# output "subnet_ocid" {
#   value = "${module.vcn_tf.subnet_ocid}"
# }

# output "network_ocid" {
#   value = "${module.vcn_tf.network_ocid}"
# }

output "show-shapes" {
  value = "${data.oci_core_shapes.core_shapes.shapes}"
}

# output "public_ip" {
#   value = "${module.instance1.public_ip}"
# }

output "identity_compartments" {
  value = "${data.oci_identity_compartments.identity_compartments.compartments}"
}



