# dotfiles

- Configuration files for Neovim and Fish shell
- Boilerplate for Web Development
- Script for creating the boilerplate

All of these config files are stored in Home directory so I setup a Git Bare Repository to upload all of these to Github therefore keeping a backup making it easy to port the same config to other machines

[Guide for Git Bare Repo](https://www.atlassian.com/git/tutorials/dotfiles)

## Neovim 

![Screenshot](screenshot.png "Neovim Looks")

### Folder Structure for Neovim Configuration
```
📂 ~/.config/nvim
├── 📂 lua
│ ├── 🌑 plugin_config.lua
│ ├── 🌑 plugins.lua
│ ├── 🌑 remaps.lua
│ ├── 🌑 settings.lua
├── 📁 plugin
│ ├── 🌑 coc.vim
└── 🌑 init.lua
```
