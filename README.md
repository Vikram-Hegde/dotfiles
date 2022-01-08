# dotfiles

- Configuration files for Neovim and Fish shell
- Boilerplate for Web Development
- Script for creating the boilerplate

[Guide for Git Bare Repo](https://www.atlassian.com/git/tutorials/dotfiles) for setting up your own dotfiles manager.

## Neovim 

### Web Dev
![Web Development Screenshot](web_dev_sc.png "Neovim for web dev")

### C / C++
![C/C++ development Screenshot](cAndC++_sc.png "Neovim for c/c++ with output")

### Folder Structure for Neovim Configuration
```
config/nvim
├── coc-settings.json
├── init.lua
├── lua
│   ├── disabled.lua
│   ├── plugin_config
│   │   ├── autosave.lua
│   │   ├── bufferline.lua
│   │   ├── formatconfig.lua
│   │   ├── lualine.lua
│   │   ├── tabout.lua
│   │   ├── telescope.lua
│   │   ├── toggleterm.lua
│   │   └── treesitter.lua
│   ├── plugins.lua
│   ├── remaps.lua
│   ├── settings.lua
│   └── utils.lua
├── plugin
│   ├── coc.vim
│   └── packer_compiled.lua
└── powerlinesymbols.txt
```

## ToDo

- [  ] Create a one line installer script
- [  ] Switch to LSP from ConquerorOfCode
