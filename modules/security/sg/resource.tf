resource "aws_security_group_rule" "ingress_instance_ssh" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  cidr_blocks              = ["0.0.0.0/0"]

  security_group_id        = "${aws_security_group.web_server.id}"
}

resource "aws_security_group_rule" "ingress_web_server_http" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = "${aws_security_group.lb.id}"

  security_group_id        = "${aws_security_group.web_server.id}"
}

resource "aws_security_group" "web_server" {
  name        = "${var.EnvironmentName}-sg-webserver"
  description = "Allow http traffic to/from Web Server"
  vpc_id      = "${var.VPC_ID}"

  tags = {
    Name = "${var.EnvironmentName}-sg-web-server"
  }

}


resource "aws_security_group_rule" "ingress_lb_http" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  cidr_blocks              = ["0.0.0.0/0"]

  security_group_id         = "${aws_security_group.lb.id}"
}
resource "aws_security_group_rule" "egress_lb_http" {
  type                     = "egress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = "${aws_security_group.web_server.id}"

  security_group_id = "${aws_security_group.lb.id}"
}

resource "aws_security_group" "lb" {
  name        = "${var.EnvironmentName}-sg-lb"
  description = "Allow http traffic to/from LB"
  vpc_id      = "${var.VPC_ID}"

  tags = {
    Name = "${var.EnvironmentName}-sg-lb"
  }

}