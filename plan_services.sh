#!/usr/bin/env bash

cd modules/services
terraform init

terraform plan -var-file="../../parameters.tfvars"
cd ../..
