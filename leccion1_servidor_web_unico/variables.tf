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

variable "instance_image_ocid" {
  type = map(string)
  default = {
    // Coloca aquí los OCIDs de las imágenes para cada región que uses
    "us-phoenix-1" = "ocid1.image.oc1.phx.your_image_ocid_here"
  }
}