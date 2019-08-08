#!/usr/bin/env bash

while getopts m: option
do
case "${option}"
in
m) TERRAFORM_MODE=${OPTARG};;
esac
done

if [ -z $TERRAFORM_MODE ]; then
  # by default it runs 'terraform apply'. With -m you can run 'terraform plan' or 'terraform destroy'
  TERRAFORM_MODE="apply"
fi


pushd modules/network
terraform init -backend-config="key=state/network/hawa_backend_config"

terraform ${TERRAFORM_MODE} -var-file="../../parameters.tfvars"
popd
