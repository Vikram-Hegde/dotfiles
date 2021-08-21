#!/bin/bash

if [ -f "./*.scss" ]; then
    echo "Scss file exists... compiling it"
    sass --watch --no-source-map ./style*.scss ./style.css
else 
    if [ -d "./styles" -a -d "./styles/scss" ]; then 
        cd styles
        echo "Scss files exists... compiling"
        sass --watch --no-source-map scss:css
    else
        echo "Scss file not found.."
    fi
fi
