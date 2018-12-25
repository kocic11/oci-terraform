# Output the result
output "public_ip" {
  value = "${oci_core_instance.TFInstance.public_ip}"
}
