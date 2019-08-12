# hawa-terraform
Deploy a highly available web app using Terraform

This code deploys a highly available static web app in AWS. It deploys 4 EC2 instances by default in 2 Availability zones. They are launched by a launch configuration that is used by an Auto-Scaling group. The EC2 instances are in a private subnet and users can reach them using a Load balancer that is in a public subnet.
The number of servers is configurable. Edit `parameters.tfvars` before deployment.

![](https://github.com/tadayoni1/HA-webapp/blob/master/diagram.jpeg)


### Prerequisites
- Aws account
- An automation server in the same region as mentioned in the code which is us-west-2 in this example. A free tire t2.micro is good enough.
  - The server must have an IAM role that has permissions to create vpc, subnets, compute resources, .... You may pick ```AdministratorAccess``` policy for your IAM role.
- A key pair that is configured in `parameters.tfvars`

User data on the scaling group downloads a zip file from an s3 bucket and unzips it to `/var/www/html`. 
Thus you need 
- A s3 bucket that gives permission to the IAM role for AutoScaling group which is defined in `parameters.tfvars` as `EC2InstanceRole'.
  - Also update `S3BucketName` in `parameters.tfvars`
- A zip file containing your web app

### Deployment Steps
- Clone the repo or copy the automation code to your automation server.
  - On your automation server run `./apply_all.sh`
  - Alternatively you may run `./provision_network.sh`, `./provision_security.sh`, `./provision_services.sh` in the order.

To delete all componenets run `destory_all.sh` or alternatively run `./provision_network.sh -m destroy`, `./provision_security.sh -m destroy`, `./provision_services.sh -m destroy` in the order.


### License

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.
