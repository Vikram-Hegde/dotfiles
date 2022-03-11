#!/bin/bash

read -p "Enter Code editor: " editor
read -p "Enter folder name: " folderName

openEditor() {
  #   mkdir "$2" && cd "$2" && mkdir styles images
  #   cp ~/Templates/Web/index.html ./
  #   cd styles && mkdir scss css
  #   cd scss && cp ~/Templates/Web/*.scss ./
  #   cd ../../
  #   "$1" "./index.html"
		# # compiling sass only works with vscode(works with nvim when it's quit)
  #   cd styles && sass --no-source-map --watch scss:css
	mkdir "$2" && pushd "$2" && mkdir styles images
  cp ~/Templates/Web/index.html ./
	pushd styles && cp ~/Templates/Web/*.scss ./
	popd
	popd
	"$1" && compile-sass
}

if [ $editor == "code" ] || [ $editor == "vim" ] || [ $editor == "nvim" ]
then
    echo "Off you go 🚀"
    openEditor "$editor" "$folderName"
else
    echo -e "\nEditor not available 😕. Try code or (n)vim"
fi
