# Launch Configuration
data "template_file" "launch" {
  template = "${file("${path.module}/user-data.sh.tpl")}"
}


resource "aws_launch_configuration" "lc" {
  name_prefix          = "${var.EnvironmentName}-lc"
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

# Auto Scaling Group
resource "aws_autoscaling_group" "default" {
  name                      = "${var.EnvironmentName}-asg"
  launch_configuration      = "${aws_launch_configuration.lc.name}"
  vpc_zone_identifier       = ["${var.private_subnet_1_id}", "${var.private_subnet_2_id}"]

  max_size                  = "${var.ASGMaxSize}"
  min_size                  = "${var.ASGMinSize}"
  desired_capacity          = "${var.ASGDesiredSize}"
  target_group_arns         = ["${var.lb_target_group_arn}"]

  root_block_device = [
    {
      volume_type = "standard"
      volume_size = "8"
    },
  ]

}
