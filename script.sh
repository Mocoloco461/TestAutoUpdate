#!/bin/bash

# Step 1: Rename this script by appending a "1" to its name
script_name=$(basename -- "$0")
new_name="${script_name}1"
mv -- "$0" "$new_name"

# Step 2: Delete all other items in the directory except for the new script
find . -not -name "$new_name" -delete

# Step 3: Clone the GitHub repository
git clone https://github.com/Mocoloco461/TestAutoUpdate.git

# Step 4: Delete this script file
rm -- "$new_name"

