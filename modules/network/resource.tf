resource "aws_vpc" "main" {
  cidr_block           = "${var.VpcCIDR}"
  instance_tenancy     = "dedicated"
  enable_dns_hostnames = "${var.EnableDnsHostnames}"

  tags = {
    Name = "${var.EnvironmentName}-vpc"
  }
}