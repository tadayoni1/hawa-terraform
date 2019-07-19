data "template_file" "launch" {
  template = "${file("${path.module}/user-data.sh.tpl")}"
}


resource "aws_launch_configuration" "lc" {
  name                 = "${var.EnvironmentName}-lc"
  image_id             = "${var.image_id}"
  instance_type        = "${var.instance_type}"
  iam_instance_profile = "${var.EC2InstanceRole}"
  key_name             = "${var.instance_key_name}"
  security_groups      = ["${var.web_server_sg_id}"]
  user_data            = "${data.template_file.launch.rendered}"

  lifecycle {
    create_before_destroy = true
  }
}