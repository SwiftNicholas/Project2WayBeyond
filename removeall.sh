#!/bin/bash

read -p "Are you sure you want to undo everything? [y/N]" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo
  exit 0
fi

sudo service apache2 stop
sudo apt remove apache2 -y
sudo apt remove mysql-server -y
sudo apt remove php libapache2-mod-php php-mysql -y
sudo apt remove php-curl php-gd php-xml php-mbstring php-xmlrpc php-zip php-soap php-intl -y
sudo apt autoremove -y
sudo rm -rf /var/www/html
sudo sed -i '/<Directory \/var\/www\/html>/d' /etc/apache2/sites-available/000-default.conf
sudo sed -i '/  AllowOverride All/d' /etc/apache2/sites-available/000-default.conf
sudo sed -i '/<\/Directory>/d' /etc/apache2/sites-available/000-default.conf
sudo rm -rf /var/lib/mysql
sudo rm -rf /etc/mysql

sudo apt-get clean
sudo dpkg --configure -a
sudo apt-get upgrade

echo "Completed Removal"
