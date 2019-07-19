module "asg" {
    source = "./asg/"

    EnvironmentName             = "${var.EnvironmentName}"

    image_id                    = "${var.image_id}"
    instance_type               = "${var.instance_type}"
    EC2InstanceRole             = "${var.EC2InstanceRole}"
    instance_key_name           = "${var.instance_key_name}"
    web_server_sg_id            = "${var.web_server_sg_id}"

    ASGMinSize                  = "${var.ASGMinSize}"
    ASGMaxSize                  = "${var.ASGMaxSize}"
    ASGDesiredSize              = "${var.ASGDesiredSize}"

    private_subnet_1_id         = "${var.private_subnet_1_id}"
    private_subnet_2_id         = "${var.private_subnet_2_id}"

    lb_target_group_arn         = "${module.lb.lb_target_group_arn}"

}

module "lb" {
    source = "./lb/"

    EnvironmentName             = "${var.EnvironmentName}"
    VPC_ID                      = "${var.VPC_ID}"

    HealthCheckIntervalSeconds  = "${var.HealthCheckIntervalSeconds}"
    HealthCheckPath             = "${var.HealthCheckPath}"
    HealthCheckProtocol         = "${var.HealthCheckProtocol}"
    HealthCheckTimeoutSeconds   = "${var.HealthCheckTimeoutSeconds}"
    HealthyThresholdCount       = "${var.HealthyThresholdCount}"
    UnhealthyThresholdCount     = "${var.UnhealthyThresholdCount}"
    TargetGroupPort             = "${var.TargetGroupPort}"
    TargetGroupProtocol         = "${var.TargetGroupProtocol}"

    public_subnet_1_id          = "${var.public_subnet_1_id}"
    public_subnet_2_id          = "${var.public_subnet_2_id}"

    lb_sg_id                    = "${var.lb_sg_id}"

}