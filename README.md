** Work in progress **


# hawa-terraform
Deploy a highly available web app using Terraform

This code deploys a highly available web app in AWS. It deploys 4 EC2 instances by default in 2 Availability zones. They are launched by a launch configuration that is used by an Auto-Scaling group. The EC2 instances are in a private subnet and users can reach them using a Load balancer that is in a public subnet.

![](https://github.com/tadayoni1/HA-webapp/blob/master/diagram.jpeg)


### Prerequisites
- Aws account
- A server in the same region as mentioned in the code which is us-west-2 in this example.
  - The server must have an IAM role that has permissions to create vpc, subnets, compute resources, .... You may pick ```AdministratorAccess``` policy for your IAM role.

User data on the scaling group downloads a zip file from an s3 bucket and unzips it to `/var/www/html`. 
Thus you need 
- A s3 bucket that gives permission to the IAM role for AutoScaling group which is defined in `parameters.tfvars` as `EC2InstanceRole'.
  - Also update `S3BucketName` in `parameters.tfvars`
- A zip file containing your web app
