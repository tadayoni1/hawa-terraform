# General 
variable EnvironmentName {}
variable aws_region {}

# IAM
variable "S3BucketName" {}
variable "EC2InstanceRole" {}

# VPC
variable EnableDnsHostnames {}
variable VpcCIDR {}
## Loaded when terraform apply is run
variable "VPC_ID" {}


# Subnets
variable PublicSubnet1CIDR {}
variable PublicSubnet2CIDR {}
variable PrivateSubnet1CIDR {}
variable PrivateSubnet2CIDR {}
