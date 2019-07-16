** Work in progress **


# hawa-terraform
Deploy a highly available web app using Terraform

This code deploys a highly available web app in AWS. It deploys 4 EC2 instances by default in 2 Availability zones. They are launched by a launch configuration that is used by an Auto-Scaling group. The EC2 instances are in a private subnet and users can reach them using a Load balancer that is in a public subnet.

![](https://github.com/tadayoni1/HA-webapp/blob/master/diagram.jpeg)


