##!/bin/bash

IP_ADDRESSES=()

# Get all network interfaces
interfaces=$(ip -o -4 addr show | awk '{print $2}')

# Loop through all network interfaces
for interface in $interfaces
do
  # Get the IP address of the interface
  ip_address=$(ip -o -4 addr show "$interface" | awk '{print $4}' | cut -d/ -f1)

  # Skip the loopback address
  if [[ $ip_address != "127.0.0.1" ]]; then
    IP_ADDRESSES+=("$ip_address")
  fi
done

# Print the list of IP addresses
echo "List of IP addresses:"
for i in "${!IP_ADDRESSES[@]}"; do
  echo "$((i + 1))) ${IP_ADDRESSES[i]}"
done

# Prompt the user to select an IP address
read -p "Enter the number of the IP address you want to use: " selection


# Validate the user input
if [[ $selection -lt 1 || $selection -gt ${#IP_ADDRESSES[@]} ]]; then
  echo "Invalid selection. Exiting script."
  exit 1
fi

# Select the user-chosen IP address
IP_ADDRESS=${IP_ADDRESSES[((selection - 1))]}

# Print the selected IP address
echo "Selected IP address: $IP_ADDRESS"

MYSQL_PASSWORD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
echo "MYSQL_PASSWORD=$MYSQL_PASSWORD"
echo "$MYSQL_PASSWORD" > mysql_password.txt
xdg-open mysql_password.txt


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
