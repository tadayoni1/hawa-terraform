#!/usr/bin/env bash

cd modules
terraform init

terraform apply -var-file="../parameters.tfvars"
cd ..
