# Outputs del proyecto 

output "instance_public_ip" {
  value = oci_core_instance.tf_instance.public_ip
}

output "instance_state" {
  value = oci_core_instance.tf_instance.state
}

output "generated_private_key_pem" {
  value     = tls_private_key.public_private_key_pair.private_key_pem
  sensitive = true
}