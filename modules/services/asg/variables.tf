# General
variable "EnvironmentName" {}


# ASG
variable "image_id" {}
variable "instance_type" {}
variable "EC2InstanceRole" {}
variable "instance_key_name" {}
variable "web_server_sg_id" {}
variable "ASGMinSize" {}
variable "ASGMaxSize" {}
variable "ASGDesiredSize" {}


variable "lb_target_group_arn" {}

