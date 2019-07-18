#!/usr/bin/env bash

cd modules/security
terraform init

terraform apply -var-file="../../parameters.tfvars"
cd ../..
