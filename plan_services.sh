#!/usr/bin/env bash

pushd modules/network
terraform init -backend-config="key=state/network/hawa_backend_config"

vpc_id=$(terraform output "VpcID")
popd

pushd modules/security
terraform init -backend-config="key=state/security/hawa_backend_config"

web_server_sg_id=$(terraform output "web_server_sg_id")
lb_sg_id=$(terraform output "lb_sg_id")
popd

pushd modules/services
terraform init -backend-config="key=state/services/hawa_backend_config"

terraform plan -var-file="../../parameters.tfvars" -var="web_server_sg_id=$web_server_sg_id" -var="lb_sg_id=$lb_sg_id" -var="VPC_ID=$vpc_id"
popd
