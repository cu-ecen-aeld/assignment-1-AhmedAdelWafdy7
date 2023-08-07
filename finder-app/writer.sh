#!/bin/bash

writefile="$1"
writestr="$2"

#!/bin/bash

writefile=$1
writestr=$2

if [ $# != 2 ]; then
    echo "Not all parameters were given!"
    exit 1
fi

if [ -z "$writestr" ]; then
    echo "Write string is not specified!"
    exit 1
fi


if [ $# -ne 2 ]; then
    echo "Usage: $0 <filename> <string>"
    exit 1
fi

# Check if the directory of the writefile exists, create it if not
if ! mkdir -p "$(dirname "$writefile")"; then
    echo "Path could not be created: $(dirname "$writefile")"
    exit 1
fi

# Try to create the file, exit if it fails
if ! touch "$writefile"; then
    echo "File could not be created: $writefile"
    exit 1
fi

# Write the string to the file
echo "$writestr" > "$writefile"

echo "Content written to $writefile:"
cat "$writefile"

exit 1
