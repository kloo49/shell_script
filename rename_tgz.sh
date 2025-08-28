# !/bin/bash

cd /Users/kyloo/Downloads
find . -name "*.txt" | while read -r file; do

    # old file name into string
    old_name=$(basename "$file")

    # get rid of "\Data\\"
    new_name=$(echo "$old_name" | sed 's|\\Data\\\\||')

    # if the file has already been renamed, it won't do it again
    if [[ "$old_name" != "$new_name" ]]; then
        mv -- "$file" "$(dirname "$file")/$new_name"
        echo "Renamed: $file -> $new_name"
    fi
done