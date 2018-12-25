variable "compartment_id" {
  # default = "ocid1.compartment.oc1..aaaaaaaaggmuquixtn6bwmbuowwdr5aggw6is3pt2rbgn7j7xm7jt75s4wlq"
}

variable "images" {
  type = "map"

  default = {
    us-phoenix-1   = "ocid1.image.oc1.phx.aaaaaaaaupbfz5f5hdvejulmalhyb6goieolullgkpumorbvxlwkaowglslq"
    us-ashburn-1   = "ocid1.image.oc1.iad.aaaaaaaajlw3xfie2t5t52uegyhiq2npx7bqyu4uvi2zyu3w3mqayc2bxmaa"
    eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa7d3fsb6272srnftyi4dphdgfjf6gurxqhmv6ileds7ba3m2gltxq"
    uk-london-1    = "ocid1.image.oc1.uk-london-1.aaaaaaaaa6h6gj6v4n56mqrbgnosskq63blyv2752g36zerymy63cfkojiiq"
  }
}

variable "BootStrapFile" {
  default = "./userdata/bootstrap"
}

variable availability_domain {}
variable display_name {}
variable hostname_label {}

variable "source_type" {
  default = "image"
}

variable "source_id" {}

variable shape {}
variable subnet_id {}
variable region {}
variable ssh_public_key {}
