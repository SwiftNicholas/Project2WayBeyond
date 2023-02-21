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

# Count the number of files with user write permissions
echo "Counting files with user write permissions..."
ls -la $WP_PATH | grep ^- | awk '{print $1}' | grep -o u=w | wc -l

# Write the output to a text file
echo "Writing output to file..."
ls -la $WP_PATH | grep ^- | awk '{print $1}' | grep -o u=w | wc -l > output.txt

# Read the output from the text file and evaluate the conditional statement
echo "Evaluating conditional statement..."
if [[ $(cat output.txt) -ge 1 ]]; then
    echo "There is at least one file with user write permissions in the directory."
else
    echo "There are no files with user write permissions in the directory."
fi
