# General 
variable EnvironmentName {}
variable aws_region {}

# IAM
variable "S3BucketName" {}
variable "EC2InstanceRole" {}

# VPC
variable EnableDnsHostnames {}
variable VpcCIDR {}


# Subnets
variable PublicSubnet1CIDR {}
variable PublicSubnet2CIDR {}
variable PrivateSubnet1CIDR {}
variable PrivateSubnet2CIDR {}


# ASG
variable "image_id" {}
variable "instance_type" {}
variable "instance_key_name" {}
