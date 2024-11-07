#!/bin/bash
sudo yum -y update
sudo yum install httpd -y
cd /var/www/html
sudo echo "Response coming from server" > /var/www/html/index.html
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl status httpd
