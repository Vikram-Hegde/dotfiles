--[[

   ________  ____ ___  ____ _____  _____
  / ___/ _ \/ __ `__ \/ __ `/ __ \/ ___/
 / /  /  __/ / / / / / /_/ / /_/ (__  )
/_/   \___/_/ /_/ /_/\__,_/ .___/____/
                         /_/

--]]
local g = vim.g
local cmd = vim.cmd
-- Helper function to set noremap
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- In order to make <Space> as leader key
map('n', '<Space>', '<NOP>', {silent = true})

-- Easier to reach 0 than ^
map('n', '0', '^')

-- Makes sense to do this one. like C and D.
map('n', 'Y', 'y$')

-- Cursor in center while <C-d> and <C-u>
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- Moving lines
map('n', '<A-j>', ':m .+1<CR>==', {silent = true})
map('n', '<A-k>', ':m .-2<CR>==', {silent = true})
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi', {silent = true})
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi', {silent = true})
map('v', '<A-j', ":m '>+1<CR>gv=gv", {silent = true})
map('v', '<A-j', ":m '<-2<CR>gv=gv", {silent = true})

-- Change to current directory
map('n', '<leader>dd', ':lcd %:h<CR>')
-- Change to upper directory
map('n', '<leader>du', ':cd ..<CR>')

-- Switch between buffers easily
map('n', '<tab>', ':bnext<CR>')
map('n', '<s-tab>', ':bprevious<CR>')
map('n', '<leader>q', ':bd<CR>')

-- Move between spilt windows
map('n', '<C-h>', ':wincmd h<CR>', {silent = true})
map('n', '<C-j>', ':wincmd j<CR>', {silent = true})
map('n', '<C-k>', ':wincmd k<CR>', {silent = true})
map('n', '<C-l>', ':wincmd l<CR>', {silent = true})

-- NVIM TREE toggle
map('n', '<leader>e', ':NvimTreeToggle<CR>', {silent = true})
map('n', '<leader>fs', ':NvimTreeFindFile<CR>', {silent = true})

-- GoTo Dashboard
map('n', '<leader>db', '<cmd>Dashboard<CR>', {silent = true})

-- GoTo Config File
map('n', '<leader>lc', ':e ~/.config/nvim/init.lua<CR>', {silent = true})

-- Source Lua file
map('n', '<leader>ls', ':luafile %<CR>')

-- Switch material themes easily
map('n', '<leader>mm', '[[<Cmd>lua require("material.functions").toggle_style()<CR>]]', {silent = true})

-- Telescope
map('n', '<leader>o', '<cmd>Telescope find_files<CR>', {silent = true})
map('n', '<leader>fw', '<cmd>Telescope live_grep<CR>', {silent = true})
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', {silent = true})
map('n', '<leader>fr', '<cmd>Telescope oldfiles<CR>', {silent = true})

-- Floaterm Remaps
g.floaterm_keymap_new = '<leader>tn'
g.floaterm_keymap_toggle = '<leader>tt'
g.floaterm_keymap_prev = '<leader>th'
g.floaterm_keymap_next = '<leader>tl'

-- Convert all px to rem
cmd [[ autocmd Filetype scss nnoremap <leader>rem :%s#\(\d\+\)px#\=printf("%.2f", (submatch(1) / 16.0))."rem"#g<CR> ]]
