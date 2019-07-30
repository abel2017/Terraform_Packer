packer build template.json | tee output.txt
AMI_ID=`tail -2 output.txt | head -2 | awk 'match($0, /ami-.*/) {print substr($0, RSTART, RLENGTH) }'`
echo 'variable AMI_ID { default = "'${AMI_ID}'" }' > ami_var.tf
terraform apply
