#!/bin/bash

# Empty the /var/www/html directory
sudo chown $USER:$USER /var/www/html/*
sudo rm -rf /var/www/html/*

# Verify the html directory is empty
echo "Verifying the html directory is empty..."
sudo ls /var/www/html/

# Install git
echo "Installing git..."
sudo apt install git -y

# Clone the WordPress repository into /var/www/html
sudo git clone https://github.com/WordPress/WordPress /var/www/html/

# Verify WordPress is installed
echo "Verifying WordPress is installed..."
sudo ls /var/www/html

# Verify permissions
echo "Verifying permissions..."
sudo ls -ls /var/www/html

# Set ownership of the /var/www/html contents and directory to Apache user
sudo chown -R www-data:www-data /var/www/html/*
sudo chown www-data:www-data /var/www/html

# Enable Apache overrides for /var/www path
echo "Enabling Apache overrides for /var/www path..."
sudo nano /etc/apache2/apache2.conf

# Create .htaccess file to secure the .git directory
echo "Creating .htaccess file to secure the .git directory..."
sudo nano /var/www/html/.git/.htaccess
echo "order deny, allow" >> /var/www/html/.git/.htaccess
echo "deny from all" >> /var/www/html/.git/.htaccess

# Restart Apache2 service
echo "Restarting Apache2 service..."
sudo service apache2 restart
