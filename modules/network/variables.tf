variable "VPC-CIDR" {
  default = "10.0.0.0/26"
}

variable "compartment_id" {
    # default = "ocid1.compartment.oc1..aaaaaaaaggmuquixtn6bwmbuowwdr5aggw6is3pt2rbgn7j7xm7jt75s4wlq"
}

variable "PubSubnetAD1CIDR" {
  default = "10.0.0.0/28"
}

variable "tenancy_ocid" {
    default = "ocid1.tenancy.oc1..aaaaaaaazabhxa2ah2t3kwqx6azvo2tl7myjxzq2jdxjf2tabn6mndnrh5lq"
}

variable "availability_domain" {
  
}

variable "display_name" {
  description = "This sets subnet display name"
  default = "PublicSubnetAD1"
}

variable "dns_label" {
  description = "This sets subnet DNS label"
  default= "PublicSubnetAD1"
}




