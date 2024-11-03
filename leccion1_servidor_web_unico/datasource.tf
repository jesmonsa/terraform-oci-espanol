# Home Region Subscription DataSource
data "oci_identity_region_subscriptions" "home_region_subscriptions" { # definir el data source de las suscripciones de la región de inicio
  tenancy_id = var.tenancy_ocid # definir el OCID del tenancy

  filter { # definir el filtro
    name   = "is_home_region" # definir el nombre del filtro
    values = [true] # definir el valor del filtro
  }
}

# ADs DataSource
data "oci_identity_availability_domains" "ADs" { # definir el data source de los dominios de disponibilidad
  compartment_id = var.tenancy_ocid # definir el OCID del compartimento
}

# Images DataSource
data "oci_core_images" "OSImage" { # definir el data source de las imágenes
  compartment_id           = var.compartment_ocid # definir el OCID del compartimento
  operating_system         = var.instance_os # definir el sistema operativo
  operating_system_version = var.linux_os_version # definir la versión del sistema operativo
  shape                    = var.Shape # definir la forma

  filter {
    name   = "display_name" # definir el nombre del filtro
    values = ["^.*Oracle[^G]*$"] # definir el valor del filtro
    regex  = true # definir si el filtro es una expresión regular
  }
}

# Compute VNIC Attachment DataSource
data "oci_core_vnic_attachments" "Webserver1_VNIC1_attach" { # definir el data source de los adjuntos de la VNIC
  availability_domain = var.availablity_domain_name == "" ? lookup(data.oci_identity_availability_domains.ADs. availability_domains[0], "name") : var.availablity_domain_name # definir el dominio de disponibilidad
  compartment_id      = oci_identity_compartment.Prod_01.id # definir el OCID del compartimento
  instance_id         = oci_core_instance.Webserver1.id # definir el OCID de la instancia
}