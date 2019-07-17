#!/usr/bin/env bash

cd modules
terraform init

terraform plan -var-file="../parameters.tfvars"
cd ..
