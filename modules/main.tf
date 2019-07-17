module "network" {
    source = "./network/"

    EnableDnsHostnames          = "${var.EnableDnsHostnames}"
    VpcCIDR                     = "${var.VpcCIDR}"
    EnvironmentName             = "${var.EnvironmentName}"

    PublicSubnet1CIDR           = "${var.PublicSubnet1CIDR}"
    PublicSubnet2CIDR           = "${var.PublicSubnet2CIDR}"
    PrivateSubnet1CIDR          = "${var.PrivateSubnet1CIDR}"
    PrivateSubnet2CIDR          = "${var.PrivateSubnet2CIDR}"
}