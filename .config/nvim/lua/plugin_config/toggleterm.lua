local cmd = vim.cmd;
local api = vim.api;

local toggleterm = require("toggleterm")

toggleterm.setup {
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 12
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction =  'horizontal',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
}

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'

cmd 'autocmd FileType javascript nnoremap <buffer> <leader>c :TermExec cmd="node %"<CR>'
cmd 'autocmd FileType c nnoremap <buffer> <leader>c :TermExec cmd="gcc % -lm && ./a.out && rm ./a.out" direction=vertical<CR>'
cmd 'autocmd FileType python nnoremap <buffer> <leader>c :TermExec cmd="python3 %" direction=vertical<CR>'
cmd 'autocmd FileType cpp nnoremap <buffer> <leader>c :TermExec cmd="g++ % && ./a.out && rm ./a.out" direction=vertical<CR>'
cmd 'autocmd FileType java nnoremap <buffer> <leader>c :TermExec cmd="java %" direction=vertical<CR>'
cmd 'autocmd FileType html nnoremap <buffer> <leader>c :TermExec cmd="live-server"<CR>'
cmd 'autocmd FileType scss nnoremap <buffer> <leader>c :2TermExec cmd="compile-sass"<CR>'
cmd 'autocmd FileType sh nnoremap <buffer> <leader>c :TermExec cmd="./%"<CR>'

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "none",
  },
	close_on_exit = true,
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("Closing terminal")
  end,
})
function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
