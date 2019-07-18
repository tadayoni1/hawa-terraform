module "iam" {
    source = "./iam/"

    EnvironmentName             = "${var.EnvironmentName}"
    S3BucketName                = "${var.S3BucketName}"
    EC2InstanceRole             = "${var.EC2InstanceRole}"
}