# Configuración del proveedor OCI 
terraform { # Versión de Terraform.
  required_providers { # Proveedores requeridos.
    oci = {
      source = "oracle/oci" # Fuente del proveedor de OCI.
      version = "5.35.0" # Versión del proveedor de OCI.
    }
  }
}

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}