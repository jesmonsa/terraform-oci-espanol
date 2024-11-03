# Configuración de la VCN 

resource "oci_core_vcn" "tf_vcn" {
  cidr_block     = var.vcn_cidr
  compartment_id = oci_identity_compartment.tf_compartment.id
  display_name   = "tf-vcn"
  dns_label      = "tfvcn"
}

resource "oci_core_subnet" "tf_subnet" {
  cidr_block        = var.subnet_cidr
  display_name      = "tf-subnet"
  compartment_id    = oci_identity_compartment.tf_compartment.id
  vcn_id            = oci_core_vcn.tf_vcn.id
  route_table_id    = oci_core_route_table.tf_route_table.id
  security_list_ids = [oci_core_security_list.tf_security_list.id]
  dhcp_options_id   = oci_core_vcn.tf_vcn.default_dhcp_options_id
}

resource "oci_core_internet_gateway" "tf_internet_gateway" {
  compartment_id = oci_identity_compartment.tf_compartment.id
  display_name   = "tf-internet-gateway"
  vcn_id         = oci_core_vcn.tf_vcn.id
}

resource "oci_core_route_table" "tf_route_table" {
  compartment_id = oci_identity_compartment.tf_compartment.id
  vcn_id         = oci_core_vcn.tf_vcn.id
  display_name   = "tf-route-table"

  route_rules {
    destination       = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.tf_internet_gateway.id
  }
}

resource "oci_core_security_list" "tf_security_list" {
  compartment_id = oci_identity_compartment.tf_compartment.id
  vcn_id         = oci_core_vcn.tf_vcn.id
  display_name   = "tf-security-list"

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 80
      max = 80
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 22
      max = 22
    }
  }
}