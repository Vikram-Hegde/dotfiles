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
-- For some reason adding this in a .vim file works but not here. might be some conflict
cmd [[ autocmd BufNewFile,BufRead * set formatoptions-=cro ]]

-- Remove Statusline when in NvimTree
cmd [[ au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif ]]

-- Mapping leader to <Space>
g.mapleader=' '

o.updatetime=200
o.cursorline=true
o.hidden=true
o.ignorecase=true
o.shiftwidth=2
o.tabstop=2
o.smartindent=true
o.hlsearch=false
o.relativenumber=true
o.number=true
o.wrap=false
o.backup=false
o.writebackup=false
o.swapfile=false
o.clipboard:append({ 'unnamed', 'unnamedplus' })
