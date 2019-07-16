#!/usr/bin/env bash

cd modules
terraform init

terraform destroy -var-file="../parameters.tfvars"
cd ..
