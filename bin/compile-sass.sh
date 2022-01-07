#!/bin/bash

# regex pattern to find SCSS file
file=$(find ./ -type f -name "[a-zA-Z]*\.s[a|c]ss")
fileCount=$(find ./ -type f -name "[a-zA-Z]*\.s[a|c]ss" | wc -l)
directory=$(find ./ -type d -name "scss")

if [ $fileCount == "1" ]; then
	if [ ! $directory == "" ]; then
		cd "$directory" && cd ..
		echo "SCSS directory exists... compiling"
		sass --watch --no-source-map scss:css
	elif [ -f $file ]; then
		echo "SCSS file exists... compiling it"
		sass --watch --no-source-map "$file" style.css
	else 
		echo "SCSS file doesnt exist"
	fi
else
	echo "Multiple main SCSS files exist. Ensure that except the main file the rest are partials"
fi
