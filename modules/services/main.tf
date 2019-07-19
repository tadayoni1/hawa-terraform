module "iam" {
    source = "./iam/"

    EnvironmentName             = "${var.EnvironmentName}"
    S3BucketName                = "${var.S3BucketName}"
    EC2InstanceRole             = "${var.EC2InstanceRole}"
}

module "sg" {
    source= "./sg/"

    EnvironmentName             = "${var.EnvironmentName}"
    VPC_ID                      = "${var.VPC_ID}"

}


module "asg" {
    source = "./asg/"

    EnvironmentName             = "${var.EnvironmentName}"

    image_id                    = "${var.image_id}"
    instance_type               = "${var.instance_type}"
    EC2InstanceRole             = "${var.EC2InstanceRole}"
    instance_key_name           = "${var.instance_key_name}"
    web_server_sg_id            = "${var.web_server_sg_id}"
}