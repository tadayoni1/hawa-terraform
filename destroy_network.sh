#!/usr/bin/env bash

cd modules/network
terraform init

terraform destroy -var-file="../../parameters.tfvars"
cd ../..