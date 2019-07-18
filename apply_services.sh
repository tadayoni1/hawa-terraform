#!/usr/bin/env bash

cd modules/services
terraform init

terraform apply -var-file="../../parameters.tfvars"
cd ../..
