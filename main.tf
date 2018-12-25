# Configure the Oracle Cloud Infrastructure provider with an API Key
provider "oci" {
  tenancy_ocid     = "${var.tenancy_ocid}"
  user_ocid        = "${var.user_ocid}"
  fingerprint      = "${var.fingerprint}"
  private_key_path = "${var.private_key_path}"
  region           = "${var.region}"
}

# Get a list of Availability Domains
data "oci_identity_availability_domains" "ADs" {
  compartment_id = "${var.tenancy_ocid}"

  filter {
    name   = "name"
    values = ["\\w*-${var.availability_domain}"]
    regex  = true
  }
}

data "oci_core_shapes" "core_shapes" {
  #Required
  compartment_id = "${var.compartment_ocid}"

  #Optional
  # availability_domain = "${var.availability_domain}"
  availability_domain = "${data.oci_identity_availability_domains.ADs.availability_domains.0.name}"
  image_id            = "${var.InstanceImageOCID[var.region]}"
}

data "oci_identity_compartments" "identity_compartments" {
  #Required
  compartment_id = "${var.tenancy_ocid}"

  #Optional
  access_level              = "${var.compartment_access_level}"
  compartment_id_in_subtree = "${var.compartment_compartment_id_in_subtree}"

  filter {
    name   = "name"
    values = ["${var.compartment_name}"]
  }
}

# module "vcn_tf" {
#   source              = "./modules/network"
#   availability_domain = "${var.availability_domain}"
#   compartment_id      = "${data.oci_identity_compartments.identity_compartments.compartments.0.compartment_id}"
# }

# module "instance1" {
#   source              = "./modules/compute"
#   compartment_id      = "${data.oci_identity_compartments.identity_compartments.compartments.0.compartment_id}"
#   display_name        = "display_name_1"
#   availability_domain = "${var.availability_domain}"

#   # "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[1],"name")}"
#   hostname_label = "${var.hostname}"

#   source_type = "image"
#   source_id   = "${var.InstanceImageOCID[var.region]}"

#   shape          = "${var.InstanceShape}"
#   subnet_id      = "${module.vcn_tf.subnet_ocid}"
#   region         = "${var.region}"
#   ssh_public_key = "${file("/home/akocic/.ssh/id_rsa.pub")}"
# }
