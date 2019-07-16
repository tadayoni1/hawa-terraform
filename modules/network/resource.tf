resource "aws_vpc" "main" {
  cidr_block           = "${var.VpcCidr}"
  instance_tenancy     = "dedicated"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"

  tags = {
    Name = "${var.EnvironmentName}-vpc"
  }
}