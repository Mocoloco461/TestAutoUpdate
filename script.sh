#!/bin/bash

# Step 0: Define script's current and parent directory paths
script_path=$(realpath "$0")
current_directory=$(dirname "$script_path")
parent_directory=$(dirname "$current_directory")

# Step 1: Rename this script by appending a "1" to its name
script_name=$(basename -- "$script_path")
new_name="${script_name}1"
mv -- "$script_path" "$new_name"

# Moving the script to the parent directory temporarily
mv -- "$new_name" "$parent_directory"
cd "$parent_directory"

# Step 2: Delete the original folder containing the script
# WARNING: This will delete all contents of the script's original directory
rm -rf "$current_directory"

# Step 3: Clone the GitHub repository into the current location (which is the parent of the original script's folder)
git clone https://github.com/Mocoloco461/TestAutoUpdate.git

# Step 4: Delete this script file
rm -- "$new_name"

