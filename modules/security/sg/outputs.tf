output "web_server_sg_id" {
    value = "${aws_security_group.web_server.id}"
}

output "lb_sg_id" {
    value = "${aws_security_group.lb.id}"
}