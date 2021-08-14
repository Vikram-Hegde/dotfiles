--[[
              __  __  _
   ________  / /_/ /_(_)___  ____ ______
  / ___/ _ \/ __/ __/ / __ \/ __ `/ ___/
 (__  )  __/ /_/ /_/ / / / / /_/ (__  )
/____/\___/\__/\__/_/_/ /_/\__, /____/
                          /____/

--]]
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

-- Better indenting based on filetype
cmd 'filetype plugin indent on'

-- Highlight while selecting text
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

-- Removing the annoying comments added next line
cmd 'autocmd BufNewFile,BufRead * setlocal formatoptions-=cro'

-- Dont show tabline in dashboard
cmd 'autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2'

-- Mapping leader to <Space>
g.mapleader=' '

opt.cursorline=true
opt.compatible=false
opt.termguicolors=true
opt.ignorecase=true
opt.syntax="on"
opt.shiftwidth=2
opt.tabstop=2
opt.autoindent=true
opt.smartindent=true
opt.hlsearch=false
opt.showcmd=true
opt.incsearch=true
opt.relativenumber=true
opt.number=true
opt.wrap=false
opt.backup=false
opt.writebackup=false
opt.swapfile=false
opt.clipboard:append({ 'unnamed' })
