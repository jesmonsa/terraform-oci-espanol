# Configuración de la instancia de cómputo 

resource "oci_core_instance" "tf_instance" {
  availability_domain = var.availability_domain.id
  compartment_id      = oci_identity_compartment.tf_compartment.id
  display_name        = "tf-server"
  shape               = var.instance_shape

  create_vnic_details {
    subnet_id        = oci_core_subnet.tf_subnet.id
    assign_public_ip = true
  }

  source_details {
    source_type = "image"
    source_id   = var.
  }

  metadata = {
    ssh_authorized_keys = tls_private_key.public_private_key_pair.public_key_openssh
    user_data           = base64encode(file("./userdata/bootstrap"))
  }
}