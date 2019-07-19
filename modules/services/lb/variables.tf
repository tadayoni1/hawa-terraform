# General
variable "EnvironmentName" {}

# VPC
variable "VPC_ID" {}

# Subnets
variable public_subnet_1_id {}
variable public_subnet_2_id {}

# LB
variable "HealthCheckIntervalSeconds" {}
variable "HealthCheckPath" {}
variable "HealthCheckProtocol" {}
variable "HealthCheckTimeoutSeconds" {}
variable "HealthyThresholdCount" {}
variable "UnhealthyThresholdCount" {}
variable "TargetGroupPort" {}
variable "TargetGroupProtocol" {}
variable "lb_sg_id" {}