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
    Name = "${var.EnvironmentName}-public-subnet-1"
  }

}
resource "aws_subnet" "public_subnet_2" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.PublicSubnet2CIDR}"
  map_public_ip_on_launch = true
  availability_zone = "${data.aws_availability_zones.available.names[1]}"

  tags = {
    Name = "${var.EnvironmentName}-public-subnet-2"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.PrivateSubnet1CIDR}"
  map_public_ip_on_launch = false
  availability_zone = "${data.aws_availability_zones.available.names[0]}"

  tags = {
    Name = "${var.EnvironmentName}-private-subnet-1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.PrivateSubnet2CIDR}"
  map_public_ip_on_launch = false
  availability_zone = "${data.aws_availability_zones.available.names[1]}"

  tags = {
    Name = "${var.EnvironmentName}-private-subnet-2"
  }
}

# NAT Gateway
resource "aws_eip" "eip1" {
  vpc      = true

}
resource "aws_eip" "eip2" {
  vpc      = true
}

resource "aws_nat_gateway" "ngw1" {
  allocation_id = "${aws_eip.eip1.id}"
  subnet_id     = "${aws_subnet.public_subnet_1.id}"

  tags = {
    Name = "${var.EnvironmentName}-nat-gateway-1"
  }
}

resource "aws_nat_gateway" "ngw2" {
  allocation_id = "${aws_eip.eip2.id}"
  subnet_id     = "${aws_subnet.public_subnet_2.id}"

  tags = {
    Name = "${var.EnvironmentName}-nat-gateway-2"
  }
}