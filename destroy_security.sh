#!/usr/bin/env bash

pushd modules/network
terraform init -backend-config="key=state/network/hawa_backend_config"

vpc_id=$(terraform output "VpcID")
popd

pushd modules/security
terraform init -backend-config="key=state/security/hawa_backend_config"

terraform destroy -var-file="../../parameters.tfvars" -var="VPC_ID=$vpc_id"
popd

