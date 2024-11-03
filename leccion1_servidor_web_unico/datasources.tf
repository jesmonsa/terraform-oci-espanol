# Fuentes de datos de OCI 

# ADs DataSource
data "oci_identity_availability_domains" "ADs" { 
  compartment_id = var.tenancy_ocid 
}