#!/bin/bash

writefile=$1
writestr=$2

# Check if both arguments were specified
if [ $# -ne 2 ]; then
    echo "Error: Both file path and string to write must be specified."
    exit 1
fi

# Create the directory path if it doesn't exist
mkdir -p "$(dirname "${writefile}")"

# Create the file with the specified content
if ! echo "$writestr" > "$writefile"; then
    echo "Error: File could not be created or written: $writefile"
    exit 1
fi

echo "File created successfully: $writefile"

