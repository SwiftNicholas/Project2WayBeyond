#!/bin/bash

read -p "Enter the path to your WordPress installation: " WP_PATH

# Check file ownership
if [[ $(ls -la $WP_PATH | grep ^- | awk '{print $3}' | uniq) == $(whoami) ]]; then
  echo "File ownership: OK"
else
  echo "File ownership: FAIL"
fi

# Check file permissions
if [[ $(ls -la $WP_PATH | grep ^- | awk '{print $1}' | grep -o u=w | wc -l) -ge 1 ]]; then
  echo "File permissions: OK"
else
  echo "File permissions: FAIL"
fi

# Check root directory ownership
if [[ $(ls -ld $WP_PATH | awk '{print $3}') == $(whoami) ]]; then
  echo "Root directory ownership: OK"
else
  echo "Root directory ownership: FAIL"
fi

# Check root directory permissions
if [[ $(ls -ld $WP_PATH | awk '{print $1}') == "drwxr-xr-x" ]]; then
  echo "Root directory permissions: OK"
else
  echo "Root directory permissions: FAIL"
fi

# Check wp-admin directory ownership
if [[ $(ls -ld $WP_PATH/wp-admin | awk '{print $3}') == $(whoami) ]]; then
  echo "wp-admin directory ownership: OK"
else
  echo "wp-admin directory ownership: FAIL"
fi

# Check wp-admin directory permissions
if [[ $(ls -ld $WP_PATH/wp-admin | awk '{print $1}') == "drwxr-xr-x" ]]; then
  echo "wp-admin directory permissions: OK"
else
  echo "wp-admin directory permissions: FAIL"
fi

# Check wp-includes directory ownership
if [[ $(ls -ld $WP_PATH/wp-includes | awk '{print $3}') == $(whoami) ]]; then
  echo "wp-includes directory ownership: OK"
else
  echo "wp-includes directory ownership: FAIL"
fi

# Check wp-includes directory permissions
if [[ $(ls -ld $WP_PATH/wp-includes | awk '{print $1}') == "drwxr-xr-x" ]]; then
  echo "wp-includes directory permissions: OK"
else
  echo "wp-includes directory permissions: FAIL"
fi

# Check wp-content directory ownership
if [[ $(ls -ld $WP_PATH/wp-content | awk '{print $3,$4}') == "$(whoami) www-data" ]]; then
  echo "wp-content directory ownership: OK"
else
  echo "wp-content directory ownership: FAIL"
fi

# Check wp-content directory permissions
if [[ $(ls -ld $WP_PATH/wp-content | awk '{print $1}') == "drwxrwxr-x" ]]; then
  echo "wp-content directory permissions: OK"
else
  echo "wp-content directory permissions: FAIL"
fi

# Check theme directory permissions
if [[ $(ls -ld $WP_PATH/wp-content/themes | awk '{print $1}') == "drwxr-xr-x" ]]; then
  echo "Theme directory permissions: OK"
else
  echo "Theme directory permissions: FAIL"
fi

# Check plugin directory permissions
if [[ $(ls -ld $WP_PATH/wp-content/plugins | awk '{print $1}') == "drwxr-xr-x" ]]; then
  echo "Plugin directory permissions: OK"
else
  echo "Plugin directory permissions: FAIL"
fi
