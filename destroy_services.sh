#!/usr/bin/env bash

pushd modules/services
terraform init -backend-config="key=state/services/hawa_backend_config"

terraform destroy -var-file="../../parameters.tfvars"
popd

