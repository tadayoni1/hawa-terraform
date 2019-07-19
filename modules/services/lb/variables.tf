# General
variable "EnvironmentName" {}

# VPC
variable "VPC_ID" {}

# Subnets
variable PublicSubnet1CIDR {}
variable PublicSubnet2CIDR {}

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