#!/bin/bash

# Variables
IP_ADDRESS="10.10.229.12"
MYSQL_PASSWORD="NVEGxke9mxCYpISdeMR7wF"

# Step 1: Log into Proxmox
# Check that network IP address is 10.10.229.12
# (use nmtui to verify that the IP address is correct).

# Step 2 - Install Apache, MySQL, and PHP Packages

# Update your OS and upgrade the packages to the latest version
sudo apt-get update
sudo apt upgrade

# Install the Apache web server package
sudo apt install apache2

# Open up the firewall ports so that TCP/80 and TCP/443 are allowed in.
# This command will apply a firewall profile for Apache that is available
# after the apache2 package has been installed.
sudo ufw allow in "Apache Full"

# Install the MySQL Server package
sudo apt install mysql-server

# Load the MySQL CLI.
sudo mysql <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$MYSQL_PASSWORD';
FLUSH PRIVILEGES;
exit
EOF

# Enable the Ubuntu universe repos. Some of the PHP packages required for WordPress
# require this. Edit the /etc/apt/sources.list file and add universe to the end of
# all lines, then save and exit. When finished, do an apt update to refresh the repo list.
sudo sh -c 'echo "deb http://archive.ubuntu.com/ubuntu bionic universe" >> /etc/apt/sources.list'
sudo apt update

# Install the base PHP and MySQL libraries for PHP.
# Then, install additional PHP extensions required by the WordPress software.
sudo apt install php libapache2-mod-php php-mysql
sudo apt install php-curl php-gd php-xml php-mbstring php-xmlrpc php-zip php-soap php-intl

# Enable Rewrites in Apache, so that WordPress can use Pretty (or clean) URLs.
sudo a2enmod rewrite

# Restart Apache service
service apache2 restart

# Create a test script /var/www/html/test.php
sudo bash -c 'echo "<?php phpinfo(); ?>" > /var/www/html/test.php'

# Verify the installation
echo "Verifying the installation..."
curl "http://$IP_ADDRESS/test.php"
echo "Installation complete!"
