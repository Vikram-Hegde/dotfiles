#!/bin/bash

read -p "Enter Code editor: " editor
read -p "Enter folder name: " folderName

openEditor() {
    echo "Off you go 🚀"
    mkdir "$2" && cd "$2" && mkdir styles images
    cp ~/Templates/Web/index.html ./
    cd styles && mkdir scss css
    cd scss && cp ~/Templates/Web/*.scss ./
    cd ../../
    "$1" "./index.html"
		# compiling sass only works with vscode(works with nvim when it's quit)
    cd styles && sass --no-source-map --watch scss:css
}

if [ $editor == "code" ] || [ $editor == "vim" ] || [ $editor == "nvim" ]
then
    openEditor "$editor" "$folderName"
else
    echo -e "\nEditor not available 😕. Try code or (n)vim"
fi
