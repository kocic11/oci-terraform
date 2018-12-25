resource "oci_core_virtual_network" "TFNetwork" {
  cidr_block     = "${var.VPC-CIDR}"
  compartment_id = "${var.compartment_id}"
  display_name   = "TFNetwork"
  dns_label      = "vcn1"
}

resource "oci_core_internet_gateway" "TFNetwork" {
  compartment_id = "${var.compartment_id}"
  display_name   = "TFInternetGateway"
  vcn_id         = "${oci_core_virtual_network.TFNetwork.id}"
}

resource "oci_core_route_table" "TFNetwork" {
  compartment_id = "${var.compartment_id}"
  vcn_id         = "${oci_core_virtual_network.TFNetwork.id}"
  display_name   = "TFNetwork"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = "${oci_core_internet_gateway.TFNetwork.id}"
  }
}

resource "oci_core_security_list" "PublicSubnet" {
  compartment_id = "${var.compartment_id}"
  display_name   = "Public"
  vcn_id         = "${oci_core_virtual_network.TFNetwork.id}"

  egress_security_rules = [
    {
      tcp_options {
        "max" = 27017
        "min" = 27017
      }

      destination = "${var.VPC-CIDR}"
      protocol    = "6"
    },
  ]

  ingress_security_rules = [
    {
      tcp_options {
        "max" = 80
        "min" = 80
      }

      protocol = "6"
      source   = "0.0.0.0/0"
    },
    {
      tcp_options {
        "max" = 443
        "min" = 443
      }

      protocol = "6"
      source   = "0.0.0.0/0"
    },
    {
      tcp_options {
        "max" = 22
        "min" = 22
      }

      protocol = "6"
      source   = "0.0.0.0/0"
    },
  ]
}

resource "oci_core_subnet" "PublicSubnetAD1" {
  availability_domain = "${var.availability_domain}"
  cidr_block          = "${var.PubSubnetAD1CIDR}"
  display_name        = "${var.display_name}"
  dns_label           = "${var.dns_label}"
  compartment_id      = "${var.compartment_id}"
  vcn_id              = "${oci_core_virtual_network.TFNetwork.id}"
  route_table_id      = "${oci_core_route_table.TFNetwork.id}"
  security_list_ids   = ["${oci_core_security_list.PublicSubnet.id}"]
  dhcp_options_id     = "${oci_core_virtual_network.TFNetwork.default_dhcp_options_id}"
}
