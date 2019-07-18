#!/usr/bin/env bash

cd modules/security
terraform init

terraform destroy -var-file="../../parameters.tfvars"
cd ../..
