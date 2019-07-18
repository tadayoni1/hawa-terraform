#!/usr/bin/env bash

cd modules/network
terraform init

terraform plan -var-file="../../parameters.tfvars"
cd ../..
