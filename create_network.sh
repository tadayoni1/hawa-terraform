#!/usr/bin/env bash

terraform init -backend-config="region=us-east-1" -backend-config="key=terrafrom/state/hawa_backend_config"

terraform apply -var-file="paramaters.tfvars"
