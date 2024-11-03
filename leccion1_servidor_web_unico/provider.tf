terraform { # Versión de Terraform.
  required_providers { 
    oci = {
      source = "oracle/oci" 
      version = "5.35.0" 
    }
  }
}
# General Provider 
provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

