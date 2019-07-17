# General
EnvironmentName             = "hawa"
#S3BucketName                = "tirgan-hawa"
aws_region                  = "us-west-2"


# VPC
VpcCIDR                     = "10.0.0.0/16"
PrivateDestinationCidrBlock = "10.0.0.0/16"
EnableDnsHostnames          = true
PublicSubnet1CIDR           = "10.0.0.0/24"
PublicSubnet2CIDR           = "10.0.1.0/24"
PrivateSubnet1CIDR          = "10.0.2.0/24"
PrivateSubnet2CIDR          = "10.0.3.0/24"



# IAM
#EC2InstanceRole = "HawaInstance"


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
