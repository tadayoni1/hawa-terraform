#!/usr/bin/env bash

pushd modules/security
terraform init -backend-config="key=state/security/hawa_backend_config"

vpc_id=$(terraform output "web_server_sg_id")
popd

pushd modules/servers
terraform init -backend-config="key=state/servers/hawa_backend_config"

terraform destroy -var-file="../../parameters.tfvars" -var="web_server_sg_id=$web_server_sg_id"
popd

