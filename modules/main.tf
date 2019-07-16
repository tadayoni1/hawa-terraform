module "network" {
    source = "./network/"

    EnableDnsHostnames = "${var.EnableDnsHostnames}"
    VpcCIDR = "${var.VpcCIDR}"
    EnvironmentName = "${var.EnvironmentName}"
}