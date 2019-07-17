# VPC
resource "aws_vpc" "main" {
  cidr_block           = "${var.VpcCIDR}"
  instance_tenancy     = "dedicated"
  enable_dns_hostnames = "${var.EnableDnsHostnames}"

  tags = {
    Name = "${var.EnvironmentName}-vpc"
  }
}

# Internet Gateway for the VPC
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"
  
  tags = {
    Name = "${var.EnvironmentName}-igw"
  }
}

# List of Avilability Zones
data "aws_availability_zones" "available" {
  state = "available"
}

# Subnets
resource "aws_subnet" "public_subnet_1" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.PublicSubnet1CIDR}"
  map_public_ip_on_launch = true
  availability_zone = "${data.aws_availability_zones.available.names[0]}"

  tags = {
    Name = "Main"
  }

}
resource "aws_subnet" "public_subnet_2" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.PublicSubnet2CIDR}"
  map_public_ip_on_launch = true
  availability_zone = "${data.aws_availability_zones.available.names[1]}"

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.PrivateSubnet1CIDR}"
  map_public_ip_on_launch = false
  availability_zone = "${data.aws_availability_zones.available.names[0]}"

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.PrivateSubnet2CIDR}"
  map_public_ip_on_launch = false
  availability_zone = "${data.aws_availability_zones.available.names[1]}"

  tags = {
    Name = "Main"
  }
}