#!/bin/bash

# Variables
IP_ADDRESS=$(ip addr show | grep -Eo 'inet (addr:)?([0-9].){3}[0-9]' | grep -Eo '([0-9].){3}[0-9]' | grep -v '127.0.0.1')
echo "MYSQL_PASSWORD=$MYSQL_PASSWORD"
echo "IP_ADDRESS=$IP_ADDRESS"

echo "Updating the OS and upgrading the packages to the latest version..."
sudo apt-get update
sudo apt upgrade
read -p "Press any key to continue..."

echo "Installing the Apache web server package..."
sudo apt install apache2
read -p "Press any key to continue..."

echo "Opening up the firewall ports for TCP/80 and TCP/443..."
sudo ufw allow in "Apache Full"
read -p "Press any key to continue..."

echo "Installing the MySQL Server package..."
sudo apt install mysql-server
read -p "Press any key to continue..."

echo "Setting the password for the MySQL root user..."
sudo mysql <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$MYSQL_PASSWORD';
FLUSH PRIVILEGES;
exit
EOF
read -p "Press any key to continue..."

echo "Enabling the Ubuntu universe repos..."
sudo sh -c 'echo "deb http://archive.ubuntu.com/ubuntu bionic universe" >> /etc/apt/sources.list'
sudo apt update
read -p "Press any key to continue..."

echo "Installing the base PHP and MySQL libraries for PHP..."
sudo apt install php libapache2-mod-php php-mysql
sudo apt install php-curl php-gd php-xml php-mbstring php-xmlrpc php-zip php-soap php-intl
read -p "Press any key to continue..."

echo "Enabling Rewrites in Apache..."
sudo a2enmod rewrite
sudo bash -c 'echo "<Directory /var/www/html>" >> /etc/apache2/sites-available/000-default.conf'
sudo bash -c 'echo "  AllowOverride All" >> /etc/apache2/sites-available/000-default.conf'
sudo bash -c 'echo "</Directory>" >> /etc/apache2/sites-available/000-default.conf'
read -p "Press any key to continue..."

echo "Restarting Apache service..."
service apache2 restart
read -p "Press any key to continue..."

echo "Creating a test script /var/www/html/test.php..."
sudo bash -c 'echo "<?php phpinfo(); ?>" > /var/www/html/test.php'
read -p "Press any key to continue..."

echo "Verifying the installation..."
wget -qO- "http://$IP_ADDRESS/test.php"
echo "Installation complete!"
read -p "Press any key to continue..."

echo "Opening the test.php in a web browser..."
xdg-open "http://$IP_ADDRESS/test.php"
