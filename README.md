This is a bash script repo that installs and configures various software and services on a Ubuntu-based system. The script performs the following actions:

Run ```bash installer-apacher-mysql-php.sh```

Installs the scrot package.
Gets a list of IP addresses of all network interfaces, excluding the loopback address.
Prompts the user to select an IP address from the list.
Generates a random password for the MySQL root user and stores it in a text file.
Updates the OS and upgrades the packages to the latest version.
Installs the Apache web server, opens the firewall ports for TCP/80 and TCP/443, and restarts the Apache service.
Installs the MySQL Server, sets the password for the root user, and restarts the MySQL service.
Enables the Ubuntu universe repos, installs PHP and the necessary PHP libraries, and enables mod_rewrite in Apache.
Restarts the Apache service and creates a test script to verify the PHP installation.
Installs Git and clones the WordPress repository.
Sets the ownership of the /var/www/html contents and directory to Apache user, enables Apache overrides for /var/www path, and restarts the Apache2 service.
Connects to the MySQL server as root, creates a database and user for WordPress, and updates the wp-config.php file with the database information.
The script uses the scrot package to take screenshots of the terminal at various stages of the installation and saves them to the desktop.
