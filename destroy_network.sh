#!/usr/bin/env bash

cd modules
terraform init

terraform destory -var-file="../parameters.tfvars"
cd ..
