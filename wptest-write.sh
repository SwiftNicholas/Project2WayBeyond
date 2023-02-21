#!/bin/bash

# List the files and their permissions in the specified directory
echo "Listing files in directory..."
ls -la $WP_PATH

# Filter out only the files and their permissions
echo "Filtering out files..."
ls -la $WP_PATH | grep ^-

# Extract the file permissions column
echo "Extracting file permissions..."
ls -la $WP_PATH | grep ^- | awk '{print $1}'

# Filter for only user write permissions
echo "Filtering for user write permissions..."
ls -la $WP_PATH | grep ^- | awk '{print $1}' | grep -o u=w

# Create a tabular display of the file permissions
echo "Creating tabular display of file permissions..."
printf "%-30s %-10s %-10s %-10s %s\n" "FILENAME" "OWNER" "GROUP" "OTHER" "PERMISSIONS"
ls -la $WP_PATH | grep ^- | awk '{printf "%-30s %-10s %-10s %-10s %s\n", $9, $3, $4, $1, $1; }'

# Convert permission letters to numbers and explain what they mean
echo ""
echo "Permission values: "
echo "-------------------"
echo "r (read) = 4"
echo "w (write) = 2"
echo "x (execute) = 1"
echo ""
echo "For example, if the file permissions are 'rw-r--r--', the value would be calculated as follows:"
echo "Owner permissions: (4 + 2) = 6"
echo "Group permissions: 4"
echo "Other permissions: 4"
echo "Total value: 644"
