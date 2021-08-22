# dotfiles

- Configuration files for Neovim and Fish shell
- Boilerplate for Web Development
- Script for creating the boilerplate

[Guide for Git Bare Repo](https://www.atlassian.com/git/tutorials/dotfiles) for setting up your own dotfiles management.

## Neovim 

![Screenshot](screenshot.png "Neovim Looks")

### Folder Structure for Neovim Configuration
```
config/nvim
├── coc-settings.json
├── init.lua
├── lua
│   ├── plugins_config.lua
│   ├── plugins.lua
│   ├── remaps.lua
│   └── settings.lua
└── plugin
    └── coc.vim
```

## ToDo

- [  ] Create a one line installer script
- [  ] Probably docs for keybindings ? (seems like extra work)
