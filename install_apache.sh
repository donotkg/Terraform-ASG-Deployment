#!/bin/bash

# Step 1 : Update the system
yum update -y

# Step 2 : Install Apache
yum install -y httpd

# Step 3 : Start Apache
systemctl start httpd

# Step 4 : Enable Apache on every reboot
systemctl enable httpd

# Step 5 : Create a test HTML page showing which instance is responding
echo "<h1>Hello Terraform </h1>" > /var/www/html/index.html