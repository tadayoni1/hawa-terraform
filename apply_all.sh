#!/usr/bin/env bash

pushd modules/network
terraform init -backend-config="key=state/network/hawa_backend_config"

terraform apply -auto-approve -var-file="../../parameters.tfvars"

vpc_id=$(terraform output "VpcID")
public_subnet_1_id=$(terraform output "public_subnet_1_id")
public_subnet_2_id=$(terraform output "public_subnet_2_id")
private_subnet_1_id=$(terraform output "private_subnet_1_id")
private_subnet_2_id=$(terraform output "private_subnet_2_id")
popd

pushd modules/security
terraform init -backend-config="key=state/security/hawa_backend_config"

terraform apply -auto-approve -var-file="../../parameters.tfvars" -var="VPC_ID=$vpc_id"

web_server_sg_id=$(terraform output "web_server_sg_id")
lb_sg_id=$(terraform output "lb_sg_id")
popd

pushd modules/services
terraform init -backend-config="key=state/services/hawa_backend_config"

terraform apply -auto-approve -var-file="../../parameters.tfvars" \
-var="web_server_sg_id=$web_server_sg_id" -var="lb_sg_id=$lb_sg_id" \
-var="VPC_ID=$vpc_id" \
-var="public_subnet_1_id=$public_subnet_1_id" -var="public_subnet_2_id=$public_subnet_2_id" \
-var="private_subnet_1_id=$private_subnet_1_id" -var="private_subnet_2_id=$private_subnet_2_id"
popd
