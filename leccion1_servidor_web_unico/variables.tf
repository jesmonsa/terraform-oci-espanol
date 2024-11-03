# Variables para el proyecto 

variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}

variable "compartment_name" {
  default = "terraform_compartment"
}

variable "vcn_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "instance_shape" {
  default = "VM.Standard.E2.1.Micro"
}

variable "ssh_public_key_path" {
  description = "Path to the public SSH key"
  default     = "~/.ssh/id_rsa.pub"
}

variable "instance_os" { # definir el sistema operativo de la instancia
  default = "Oracle Linux" # definir el valor por defecto
}

variable "linux_os_version" { # definir la versión del sistema operativo Linux
  default = "7.9" # definir el valor por defecto
}

variable "service_ports" { # definir los puertos de los servicios
  default = [80, 443, 22] # definir el valor por defecto
}

variable "availability_domain" {
  description = "The Availability Domain to use for the instance"
  type        = string
  default     = "US-ASHBURN-AD-1"  # Reemplaza con tu AD correcto
}