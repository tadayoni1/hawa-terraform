#!/usr/bin/env bash

pushd modules/services
terraform init -backend-config="key=state/services/hawa_backend_config"

terraform plan -var-file="../../parameters.tfvars"
popd
