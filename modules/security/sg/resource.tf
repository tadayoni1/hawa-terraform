resource "aws_security_group" "allow_http_webserver" {
  name        = "${var.EnvironmentName}"
  description = "Allow http traffic to/from Web Server"
  vpc_id      = "${var.VPC_ID}"

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    source_security_group_id  = ["${aws_security_group.allow_http_lb.id}"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.EnvironmentName}-WebServer"
  }

}

resource "aws_security_group" "allow_http_lb" {
  name        = "${var.EnvironmentName}"
  description = "Allow http traffic to/from LB"
  vpc_id      = "${var.VPC_ID}"

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"] 
  }

  egress {
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    source_security_group_id  = ["${aws_security_group.allow_http_webserver.id}"]
  }

  tags = {
    Name = "${var.EnvironmentName}-LB"
  }

}