#!/bin/bash

yum update -y
yum install -y httpd
echo '<h1>Welcome to my web page</h1>' > /var/www/html/index.html
systemctl start httpd
systemctl enable httpd
sudo yum install -y https://s3.eu-west-2.amazonaws.com/amazon-ssm-eu-west-2/latest/linux_amd64/amazon-ssm-agent.rpm
