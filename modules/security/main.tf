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