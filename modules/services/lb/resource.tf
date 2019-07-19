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
    Name = "${var.EnvironmentName}-target-group"
  }

}