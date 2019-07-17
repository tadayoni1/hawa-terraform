resource "aws_vpc" "main" {
  cidr_block           = "${var.VpcCIDR}"
  instance_tenancy     = "dedicated"
  enable_dns_hostnames = "${var.EnableDnsHostnames}"

  tags = {
    Name = "${var.EnvironmentName}-vpc"
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "${var.EnvironmentName}-igw"
  }
}