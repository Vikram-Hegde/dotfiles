#!/bin/bash

read -p "Enter Code editor: " editor
read -p "Enter folder name: " folderName

openEditor() {
	mkdir "$2" && pushd "$2" && mkdir styles images
  cp ~/Templates/Web/index.html ./
	pushd styles && cp ~/Templates/Web/*.scss ./
	cd "$(popd)"
	popd
	~/bin/compile-sass.sh & "$1" && fg
}

if [ $editor == "code" ] || [ $editor == "vim" ] || [ $editor == "nvim" ]
then
    echo "Off you go 🚀"
    openEditor "$editor" "$folderName"
else
    echo -e "\nEditor not available 😕. Try code or (n)vim"
fi
