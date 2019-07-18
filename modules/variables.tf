# General 
variable EnvironmentName {}
variable aws_region {}
# VPC
variable EnableDnsHostnames {}
variable VpcCIDR {}
# Subnets
variable PublicSubnet1CIDR {}
variable PublicSubnet2CIDR {}
variable PrivateSubnet1CIDR {}
variable PrivateSubnet2CIDR {}

# IAM
variable "S3BucketName" {}
variable "EC2InstanceRole" {}
