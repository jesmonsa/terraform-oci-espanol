@echo off
setlocal enabledelayedexpansion

:: Crear el directorio si no existe
if not exist leccion1_servidor_web_unico mkdir leccion1_servidor_web_unico
cd leccion1_servidor_web_unico

:: Crear los archivos
echo. > main.tf
echo. > variables.tf
echo. > outputs.tf
echo. > provider.tf
echo. > datasources.tf
echo. > compartment.tf
echo. > vcn.tf
echo. > compute.tf
echo. > versions.tf
echo. > terraform.tfvars
echo. > .gitignore

:: Añadir contenido básico a los archivos
echo # Configuración principal de Terraform > main.tf
echo # Variables para el proyecto > variables.tf
echo # Outputs del proyecto > outputs.tf
echo # Configuración del proveedor OCI > provider.tf
echo # Fuentes de datos de OCI > datasources.tf
echo # Configuración del compartimento > compartment.tf
echo # Configuración de la VCN > vcn.tf
echo # Configuración de la instancia de cómputo > compute.tf
echo # Versiones de Terraform y proveedores > versions.tf

:: Añadir contenido al archivo terraform.tfvars (recuerda no subir este archivo a GitHub)
(
echo # Configuración de variables (NO SUBIR A GITHUB^)
echo tenancy_ocid     = "your_tenancy_ocid"
echo user_ocid        = "your_user_ocid"
echo fingerprint      = "your_fingerprint"
echo private_key_path = "path_to_your_private_key"
echo region           = "your_region"
) > terraform.tfvars

:: Configurar .gitignore
(
echo .terraform/
echo *.tfstate
echo *.tfstate.backup
echo terraform.tfvars
echo .terraform.lock.hcl
) > .gitignore

:: Crear el directorio userdata y el archivo bootstrap
if not exist userdata mkdir userdata
echo. > userdata\bootstrap

echo Archivos creados exitosamente en la carpeta leccion1_servidor_web_unico
pause