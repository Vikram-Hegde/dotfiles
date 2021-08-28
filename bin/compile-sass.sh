#!/bin/bash

# regex pattern to find scss file
file=$(find ./ -type f -name "[a-zA-Z]*.s[a|c]ss")
fileCount=$(find ./ -type f -name "[a-zA-Z]*.s[a|c]ss" | wc -l)
directory=$(find ./ -type d -name "scss")

if [ $fileCount == "1" ]; then
	if [ ! $directory == "" ]; then
		cd "$directory" && cd ..
		echo "Scss directory exists... compiling"
		sass --watch --no-source-map scss:css
	elif [ -f $file ]; then
		echo "Scss file exists... compiling it"
		sass --watch --no-source-map "$file" style.css
	else 
		echo "Scss file doesnt exist"
	fi
else
	echo "Multiple main scss files exist. Ensure that except the main file the rest are partials"
fi
