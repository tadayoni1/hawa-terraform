#!/usr/bin/env bash

terraform init

terraform apply -var-file="parameters.tfvars"
