#!/usr/bin/env bash

pushd modules/security
terraform init -backend-config="key=state/security/hawa_backend_config"

vpc_id=$(terraform output "web_server_sg_id")
popd

pushd modules/services
terraform init -backend-config="key=state/services/hawa_backend_config"

terraform destroy -var-file="../../parameters.tfvars" -var="web_server_sg_id=$web_server_sg_id"
popd

