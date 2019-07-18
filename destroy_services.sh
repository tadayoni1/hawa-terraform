#!/usr/bin/env bash

cd modules/services
terraform init

terraform destroy -var-file="../../parameters.tfvars"
cd ../..
