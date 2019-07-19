resource "aws_lb_target_group" "tg" {
  name     = "${var.EnvironmentName}-tg"
  port     = "${var.TargetGroupPort}"
  protocol = "${var.TargetGroupProtocol}"
  vpc_id   = "${var.VPC_ID}"

  health_check {
    protocol            = "${var.HealthCheckProtocol}"
    path                = "${var.HealthCheckPath}"
    healthy_threshold   = "${var.HealthyThresholdCount}"
    unhealthy_threshold = "${var.UnhealthyThresholdCount}"
    timeout             = "${var.HealthCheckTimeoutSeconds}"
    interval            = "${var.HealthCheckIntervalSeconds}"
  }

  tags = {
    Name                = "${var.EnvironmentName}-target-group"
  }
}

resource "aws_lb" "lb" {
  name                             = "${var.EnvironmentName}-lb"

  subnets                          = ["${var.PublicSubnet1CIDR}, ${var.PublicSubnet2CIDR}"]
  security_groups                  = ["${var.lb_sg_id}"]

  enable_cross_zone_load_balancing = true
  enable_deletion_protection       = false
  idle_timeout                     = 90

  tags = {
    Name                           = "${var.EnvironmentName}-lb"
  }
}

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = "${aws_lb.lb.arn}"
  port              = "${var.TargetGroupPort}"
  protocol          = "${var.TargetGroupProtocol}"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg.arn}"
  }
}
