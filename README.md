# Terraform_Packer
Terraform and Packer

Este ejemplo consiste en crear una AMI con Packer la cual instalará un nginx básico y luego con el ID obtenido.

Pasos:

1.- Ejecutar el script:  

  ./ejecutar.sh
  
  Contenido:
  -----------
  
# Construimos la imagen con Packer según el fichero "template.json" el cual instalará un nginx básico  
packer build template.json | tee output.txt

#Cogemos el ID de la AMI creada
AMI_ID=`tail -2 output.txt | head -2 | awk 'match($0, /ami-.*/) {print substr($0, RSTART, RLENGTH) }'`

#Creamos el fichero de variable para la nueva AMI creada con Packer
echo 'variable AMI_ID { default = "'${AMI_ID}'" }' > ami_var.tf

#Aplicamos Terraform.
terraform apply
