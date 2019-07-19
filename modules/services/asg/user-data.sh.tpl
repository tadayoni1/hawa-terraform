#!/bin/bash

# Update
apt-get update -y

# Install apache
apt-get install unzip awscli -y
apt-get install apache2 -y

# start service
systemctl start apache2.service

# Copy web content to apache
cd /var/www/html
aws s3 cp s3://tirgan-hawa/hawa.zip .
unzip -o hawa.zip