# Lección 1: Servidor Web Único en OCI con Terraform

Esta lección demuestra cómo desplegar un servidor web básico en Oracle Cloud Infrastructure (OCI) utilizando Terraform.

## Contenido de la Lección

En esta lección, aprenderás a:

1. Configurar el proveedor de OCI para Terraform
2. Crear un compartimento en OCI
3. Configurar una Red Virtual en la Nube (VCN)
4. Desplegar una instancia de cómputo
5. Configurar un servidor web básico

## Archivos en esta Lección

- `compartment.tf`: Define el compartimento de OCI
- `compute.tf`: Configura la instancia de cómputo
- `datasources.tf`: Define las fuentes de datos necesarias
- `main.tf`: Archivo principal de Terraform (vacío en este caso)
- `outputs.tf`: Define las salidas después de la creación de recursos
- `provider.tf`: Configura el proveedor de OCI
- `variables.tf`: Define las variables utilizadas en la configuración
- `vcn.tf`: Configura la Red Virtual en la Nube
- `versions.tf`: Especifica las versiones de Terraform y proveedores
- `userdata/bootstrap`: Script de inicialización para el servidor web

## Requisitos Previos

1. Tener una cuenta activa en Oracle Cloud Infrastructure
2. Terraform instalado en tu máquina local (versión 0.12+)
3. Credenciales de OCI configuradas (tenancy OCID, user OCID, key fingerprint, etc.)

## Pasos para Utilizar esta Configuración

1. Clona este repositorio en tu máquina local.

2. Navega al directorio de esta lección: