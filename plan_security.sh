#!/usr/bin/env bash

cd modules/security
terraform init

terraform plan -var-file="../../parameters.tfvars"
cd ../..
