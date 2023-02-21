# Test

ls -


# Harden

For Directories:
```find /var/www/html/ -type d -exec chmod 755 {} \; ```
For Files:
```find /var/www/html/  -type f -exec chmod 644 {} \;```
