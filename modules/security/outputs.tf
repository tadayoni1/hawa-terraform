output "web_server_sg_id" {
    value = "${module.sg.web_server_sg_id}"
}

output "lb_sg_id" {
    value = "${module.sg.lb_sg_id}"
}