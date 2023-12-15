#!/bin/bash

# Check if the file exists
if [ -e "$1" ]; then
    echo "File exists"
    
    # Check if the file is an ordinary file
    if [ -f "$1" ]; then
        echo "Access permissions: $(ls -l "$1" | awk '{print $1}')"
        echo "Size: $(stat -c %s "$1") bytes"
        echo "Last modified: $(stat -c %y "$1")"
        
    # Check if the file is a directory
    elif [ -d "$1" ]; then
        num_files=$(find "$1" -type f | wc -l)
        num_subdirs=$(find "$1" -mindepth 1 -type d | wc -l)
        echo "Number of files: $num_files"
        echo "Number of subdirectories: $num_subdirs"
    fi
    
else
    echo "File does not exist"
fi