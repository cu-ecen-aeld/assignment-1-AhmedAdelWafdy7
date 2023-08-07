#!/bin/bash

filesdir=$1
searchstr=$2

if [ $# != 2 ]; then
    echo "Usage: $0 <directory_path> <search_string>"
    exit 1
fi

if [ ! -d "$filesdir" ]; then
    echo "Not a valid path: $filesdir"
    exit 1
fi

nof_expressions=$(grep -Ir "$searchstr" "$filesdir" | wc -l)
nof_files=$(grep -Ir "$searchstr" "$filesdir" | cut -d ':' -f 1 | uniq -c | wc -l)

echo "The number of files containing the search string '$searchstr' is: $nof_files"
echo "The total number of matching lines found is: $nof_expressions"

