#!/usr/bin/env bash

pushd modules/network
terraform init -backend-config="key=state/network/hawa_backend_config"

terraform apply -var-file="../../parameters.tfvars"
popd
