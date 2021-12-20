--[[

   ________  ____ ___  ____ _____  _____
  / ___/ _ \/ __ `__ \/ __ `/ __ \/ ___/
 / /  /  __/ / / / / / /_/ / /_/ (__  )
/_/   \___/_/ /_/ /_/\__,_/ .___/____/
                         /_/

--]]

local U = require('utils')
local cmd = vim.cmd

-- In order to make <Space> as leader key
U.map('n', '<Space>', '<NOP>')

-- Easier to reach 0 than ^
U.map('n', '0', '^')

-- Cursor in center while <C-d> and <C-u>
U.map('n', '<C-d>', '<C-d>zz')
U.map('n', '<C-u>', '<C-u>zz')

-- Moving lines
U.map('n', '<A-j>', ':m .+1<CR>==')
U.map('n', '<A-k>', ':m .-2<CR>==')
U.map('i', '<A-j>', '<Esc>:m .+1<CR>==gi')
U.map('i', '<A-k>', '<Esc>:m .-2<CR>==gi')
U.map('v', '<A-j>', ":m '>+1<CR>gv=gv")
U.map('v', '<A-k>', ":m '<-2<CR>gv=gv")

-- Change to current directory
U.map('n', '<leader>dd', ':lcd %:p:h<CR>')
-- Change to upper directory
U.map('n', '<leader>du', ':cd ..<CR>')

-- Switch between buffers easily
U.map('n', '<tab>', '<CMD>BufferLineCycleNext<CR>')
U.map('n', '<s-tab>', '<CMD>BufferLineCyclePrev<CR>')
U.map('n', '<leader>q', ':bd<CR>')

-- Move between spilt windows
U.map('n', '<C-h>', ':wincmd h<CR>')
U.map('n', '<C-j>', ':wincmd j<CR>')
U.map('n', '<C-k>', ':wincmd k<CR>')
U.map('n', '<C-l>', ':wincmd l<CR>')

-- File Explorer
U.map('n', '<leader>e',':CocCommand explore<CR>')

-- GoTo Config File
U.map('n', '<leader>lc', ':e ~/.config/nvim/init.lua<CR>')

-- Source Lua file
U.map('n', '<leader>ls', ':luafile %<CR>')

-- Format File
U.map('n', '<leader>p', ':Format<CR>')

-- Switch material themes easily
-- U.map('n', '<leader>mm', '[[<Cmd>lua require("material.functions").toggle_style()<CR>]]')

-- Telescope
U.map('n', '<leader>o', '<cmd>Telescope find_files<CR>')
U.map('n', '<leader>fw', '<cmd>Telescope live_grep<CR>')
U.map('n', '<leader>fb', '<cmd>Telescope buffers<CR>')
U.map('n', '<leader>fr', '<cmd>Telescope oldfiles<CR>')

-- ToggleTerm
U.map('n', '<leader>tt', '<cmd>ToggleTerm<CR>') -- Default Layout
U.map('n', '<leader>tv', '<cmd>2ToggleTerm size=50 direction=vertical<CR>') -- Vertical Layout

-- Convert all px to rem
cmd [[ autocmd Filetype scss,css,sass nnoremap <leader>rem :%s#\(\d\+\)px#\=printf("%.2f", (submatch(1) / 16.0))."rem"#g<CR> ]]
