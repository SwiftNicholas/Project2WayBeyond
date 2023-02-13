##!/bin/bash
sudo apt-get install scrot

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
scrot -e 'mv $f ~/Desktop/ipaddress.png'
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
scrot -e 'mv $f ~/Desktop/mysqlpassword.png'

echo "Updating the OS and upgrading the packages to the latest version..."
sudo apt-get update
scrot -e scrot -e 'mv $f ./update.png'
sudo apt upgrade
scrot -e 'mv $f ./upgrade.png'
read -p "Press any key to continue..."

echo "Installing the Apache web server package..."
sudo apt install apache2
scrot -e 'mv $f ./apache.png'
read -p "Press any key to continue..."

echo "Opening up the firewall ports for TCP/80 and TCP/443..."
sudo ufw allow in "Apache Full"
scrot -e 'mv $f ./apache ports.png'
read -p "Press any key to continue..."

echo "Installing the MySQL Server package..."
sudo apt install mysql-server
scrot -e 'mv $f ./mysql.png'
read -p "Press any key to continue..."

echo "Setting the password for the MySQL root user..."
sudo mysql <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$MYSQL_PASSWORD';
FLUSH PRIVILEGES;
exit
EOF
scrot -e 'mv $f ./setsqlpassword.png'
read -p "Press any key to continue..."

echo "Enabling the Ubuntu universe repos..."
sudo sh -c 'echo "deb http://archive.ubuntu.com/ubuntu bionic universe" >> /etc/apt/sources.list'
sudo apt update
scrot -e 'mv $f ./update.png'
read -p "Press any key to continue..."

echo "Installing the base PHP and MySQL libraries for PHP..."
sudo apt install php libapache2-mod-php php-mysql
scrot -e 'mv $f ./php-part1.png'
sudo apt install php-curl php-gd php-xml php-mbstring php-xmlrpc php-zip php-soap php-intl
scrot -e 'mv $f ./php-part2.png'
read -p "Press any key to continue..."

echo "Enabling Rewrites in Apache..."
sudo a2enmod rewrite
scrot -e 'mv $f ./apache-write-mod.png'
sudo bash -c 'echo "<Directory /var/www/html>" >> /etc/apache2/sites-available/000-default.conf'
sudo bash -c 'echo "  AllowOverride All" >> /etc/apache2/sites-available/000-default.conf'
sudo bash -c 'echo "</Directory>" >> /etc/apache2/sites-available/000-default.conf'
read -p "Press any key to continue..."

echo "Restarting Apache service..."
service apache2 restart
scrot -e 'mv $f ./apache-restart.png'
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

read -p "Verify the php test page..."

sudo chown $USER:$USER /var/www/html/*
sudo rm /var/www/html/*

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

