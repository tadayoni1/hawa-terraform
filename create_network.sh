#!/usr/bin/env bash

terraform init

terraform apply -var-file="paramaters.tfvars"
