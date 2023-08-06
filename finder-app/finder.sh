#!/bin/bash

# Check if the number of arguments is correct
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

# Get the arguments
filesdir="$1"
searchstr="$2"

# Check if filesdir is a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a directory."
    exit 1
fi

# Function to search for matching lines in files
search_files() {
    local dir="$1"
    local search="$2"
    local files_count=0
    local matching_lines=0

    # Loop through files and directories in the given directory
    for entry in "$dir"/*; do
        if [ -f "$entry" ]; then
            # If it's a file, count it and search for matching lines
            files_count=$((files_count + 1))
            matching_lines_in_file=$(grep -c "$search" "$entry")
            matching_lines=$((matching_lines + matching_lines_in_file))
        elif [ -d "$entry" ]; then
            # If it's a directory, recursively call the function
            subdirectory_matches=$(search_files "$entry" "$search")
            IFS=' ' read -ra subdirectory_array <<< "$subdirectory_matches"
            files_count=$((files_count + subdirectory_array[0]))
            matching_lines=$((matching_lines + subdirectory_array[1]))
        fi
    done

    echo "$files_count $matching_lines"
}

# Call the search_files function and get the result
result=$(search_files "$filesdir" "$searchstr")

# Print the result
IFS=' ' read -ra result_array <<< "$result"
files_count="${result_array[0]}"
matching_lines="${result_array[1]}"
echo "The number of files are $files_count and the number of matching lines are $matching_lines"

