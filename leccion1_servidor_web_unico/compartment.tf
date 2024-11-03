# Configuración del compartimento 

resource "oci_identity_compartment" "tf_compartment" {
  name           = var.compartment_name
  description    = "Compartimento para recursos de Terraform"
  compartment_id = var.tenancy_ocid

  enable_delete = true
}