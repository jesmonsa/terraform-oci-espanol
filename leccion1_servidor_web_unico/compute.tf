# Configuración de la instancia de cómputo 

resource "oci_core_instance" "tf_instance" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = oci_identity_compartment.tf_compartment.id
  display_name        = "tf-server"
  shape               = var.instance_shape

  create_vnic_details {
    subnet_id        = oci_core_subnet.tf_subnet.id
    assign_public_ip = true
  }

  source_details {
    source_type = "image"
    source_id   = var.instance_image_ocid[var.region]
  }

  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key_path)
    user_data           = base64encode(file("./userdata/bootstrap"))
  }
}