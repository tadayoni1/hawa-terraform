# General
EnvironmentName             = "hawa"
aws_region                  = "us-west-2"

# IAM
EC2InstanceRole             = "HawaInstance"
S3BucketName                = "tirgan-hawa"


# VPC
EnableDnsHostnames          = true
VpcCIDR                     = "10.0.0.0/16"
PublicSubnet1CIDR           = "10.0.0.0/24"
PublicSubnet2CIDR           = "10.0.1.0/24"
PrivateSubnet1CIDR          = "10.0.2.0/24"
PrivateSubnet2CIDR          = "10.0.3.0/24"


# ASG
#ASGMinSize                 = 2
#ASGMaxSize                 = 6
#ASGDesiredSize             = 4
#HealthCheckIntervalSeconds = 10
#HealthCheckPath            = "/"
#HealthCheckProtocol        = "HTTP"
#HealthCheckTimeoutSeconds  = 8
#HealthyThresholdCount      = 2
#UnhealthyThresholdCount    = 2
image_id                   = "ami-005bdb005fb00e791"
instance_type              = "t2.micro"
instance_key_name          = "hawa"
