# General 
variable EnvironmentName {}
variable aws_region {}

# IAM
variable "S3BucketName" {}
variable "EC2InstanceRole" {}

# VPC
variable EnableDnsHostnames {}
variable VpcCIDR {}
## Loaded when network modules are run, used for security and server modules
variable "VPC_ID" {}


# Subnets
variable PublicSubnet1CIDR {}
variable PublicSubnet2CIDR {}
variable PrivateSubnet1CIDR {}
variable PrivateSubnet2CIDR {}


# ASG
variable "image_id" {}
variable "instance_type" {}
variable "instance_key_name" {}
## Loaded when security modules are run, only used for server modules
variable "web_server_sg_id" {}
variable "lb_sg_id" {}
variable "ASGMinSize" {}
variable "ASGMaxSize" {}
variable "ASGDesiredSize" {}



# LB
variable "HealthCheckIntervalSeconds" {}
variable "HealthCheckPath" {}
variable "HealthCheckProtocol" {}
variable "HealthCheckTimeoutSeconds" {}
variable "HealthyThresholdCount" {}
variable "UnhealthyThresholdCount" {}
variable "TargetGroupPort" {}
variable "TargetGroupProtocol" {}
variable "public_subnet_1_id" {}
variable "public_subnet_2_id" {}
variable private_subnet_1_id {}
variable private_subnet_2_id {}


