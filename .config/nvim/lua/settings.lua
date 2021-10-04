--[[
              __  __  _
   ________  / /_/ /_(_)___  ____ ______
  / ___/ _ \/ __/ __/ / __ \/ __ `/ ___/
 (__  )  __/ /_/ /_/ / / / / /_/ (__  )
/____/\___/\__/\__/_/_/ /_/\__, /____/
                          /____/

--]]
local cmd = vim.cmd
local g = vim.g      -- a table to access global variables
local o = vim.opt  -- to set options

-- Highlight while selecting text
cmd [[ autocmd TextYankPost * lua vim.highlight.on_yank {on_visual = false} ]]

-- Dont show tabline in dashboard
cmd [[ autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2 ]]

-- Removing the annoying comments added next line
cmd [[ autocmd BufNewFile,BufRead,BufEnter,BufWinEnter,WinEnter * set formatoptions-=cro ]]

-- Remove Statusline when in NvimTree
cmd [[ autocmd BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif ]]

-- Remove tilde
-- TODO: Find a method to achieve this.

-- Mapping leader to <Space>
g.mapleader=' '

o.updatetime=200
o.termguicolors=true
o.numberwidth=5
o.cursorline=true
o.hidden=true
o.ignorecase=true
o.shiftwidth=2
o.tabstop=2
o.smartindent=true
o.smarttab=true
o.hlsearch=false
o.relativenumber=true
o.number=true
o.wrap=false
o.backup=false
o.writebackup=false
o.swapfile=false
o.clipboard:append({ 'unnamed', 'unnamedplus' })
