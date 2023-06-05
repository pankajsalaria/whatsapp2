#!/bin/bash

# Variables
remote_url="https://github.com/pankajsalaria/whatsapp2"
file_path="info.csv"
branch_name="main"
local_file_path="/home/whatsapp/whatsapp2/info.csv"

# Clone the remote repository
git clone $remote_url temp_repo
cd temp_repo

# Switch to the desired branch
git checkout $branch_name

# Check if the file has been modified
if git diff --quiet $branch_name:$file_path $local_file_path; then
  echo "File has not been modified."
else
  # Update the file with the new content
  cp $local_file_path $file_path

  # Add and commit the changes
  git add $file_path
  git commit -m "Update file $file_path"

  # Push the changes to the remote repository
  git push origin $branch_name
fi

# Clean up
cd ..
rm -rf temp_repo

