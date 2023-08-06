#!/bin/bash

# Check if the number of arguments is correct
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

# Get the arguments
writefile="$1"
writestr="$2"

# Check if writefile is specified
if [ -z "$writefile" ]; then
    echo "Error: Write file path not specified."
    exit 1
fi

# Check if writestr is specified
if [ -z "$writestr" ]; then
    echo "Error: Write string not specified."
    exit 1
fi

# Create the directory path if it doesn't exist
mkdir -p "$(dirname "$writefile")"

# Write the content to the file
echo "$writestr" > "$writefile"

# Check if the file was successfully created
if [ $? -ne 0 ]; then
    echo "Error: Failed to create the file $writefile."
    exit 1
fi

echo "File $writefile created successfully with content:"
echo "$writestr"


