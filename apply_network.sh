#!/usr/bin/env bash

cd modules/network
terraform init

terraform apply -var-file="../../parameters.tfvars"
cd ../..
