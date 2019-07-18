output "VpcID" {
    value = "${module.network.VpcID}"
}

output "public_subnet_1_id" {
  value = "${module.network.public_subnet_1_id}"
}

output "public_subnet_2_id" {
  value = "${module.network.public_subnet_2_id}"
}

output "private_subnet_1_id" {
  value = "${module.network.private_subnet_1_id}"
}

output "private_subnet_2_id" {
  value = "${module.network.private_subnet_2_id}"
}