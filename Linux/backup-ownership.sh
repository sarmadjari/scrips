#!/bin/bash

source_path="/path/to/source"

# Find all files and directories in the source path and list their owners
find "$source_path" -exec stat -c "%U %n" {} + | while read -r line; do
    owner=$(echo "$line" | awk '{print $1}')
    path=$(echo "$line" | awk '{print $2}')
    echo "chown $owner \"$path\""
done
