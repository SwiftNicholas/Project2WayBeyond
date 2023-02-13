#!/bin/bash

# Read the MySQL root password from the file
MYSQL_PASSWORD=$(cat ~/Desktop/mysqlpassword.txt | tr -d ' ')

# Connect to the MySQL server as root
mysql -u root -p$MYSQL_PASSWORD << EOF

# Create the WordPress database
CREATE DATABASE WordPressDB DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

# Create a user for the WordPress database
CREATE USER 'WordPressUser'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';

# Grant privileges to the user for the WordPress database
GRANT ALL ON WordPressDB.* TO 'WordPressUser'@'localhost';

# Refresh the privileges
flush privileges;

# Exit the MySQL shell
exit
EOF

echo "WordPress database created successfully with the following details:
Database Name: WordPressDB
Username: WordPressUser
Password: $MYSQL_PASSWORD"
