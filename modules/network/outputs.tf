output "subnet_ocid" {
  value = "${oci_core_subnet.PublicSubnetAD1.id}"
}

output "network_ocid" {
  value = "${oci_core_virtual_network.TFNetwork.id}"
}