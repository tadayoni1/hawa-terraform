module "network" {
    source = "network/"
    enable_dns_hostnames = "${var.enable_dns_hostnames}"
    VpcCIDR = "${var.VpcCIDR}"
    EnvironmentName = "${var.EnvironmentName}"
}