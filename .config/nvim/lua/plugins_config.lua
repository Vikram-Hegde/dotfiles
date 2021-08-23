--[[
                    _____
  _________  ____  / __(_)___ _
 / ___/ __ \/ __ \/ /_/ / __ `/
/ /__/ /_/ / / / / __/ / /_/ /
\___/\____/_/ /_/_/ /_/\__, /
                      /____/

--]]
local g = vim.g
local cmd = vim.cmd

-- NvimTree Config
g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
g.nvim_tree_auto_open = 1 -- opens the tree when typing `vim $DIR` or `vim`
g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' } -- empty by default, don't auto open tree on specific filetypes.
g.nvim_tree_update_cwd = 1 -- will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }

-- Color Scheme
g.material_style='darker'
g.material_borders=true
g.material_hide_eob=true
-- require('material').set()
vim.g.onedark_style = 'darker'
require('onedark').setup()

-- Lualine Config
require('lualine').setup {
	options = {
		theme = 'onedark'
	},
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { require'tabline'.tabline_buffers },
    lualine_x = { require'tabline'.tabline_tabs },
    lualine_y = {},
    lualine_z = {},
  },
	sections = {
		lualine_c = {},
		lualine_x = {'encoding'},
		lualine_y = {'fileformat'},
		lualine_z = {'progress'},
	}
}
g.tabline_show_filename_only = true

-- Changing the default value of dashboard
g.dashboard_default_executive='telescope'
g.dashboard_custom_section = {
    a = {description = {'  Recently Opened Files          SPC f r'}, command = 'Telescope oldfiles'},
    b = {description = {'  Find File                       SPC o'}, command = 'Telescope find_files'},
    c = {description = {'  Find Word                      SPC f w'}, command = 'Telescope live_grep'},
    d = {description = {'ﱮ  Open Project                   SPC f m'}, command = 'Telescope marks'},
    e = {description = {'漣 Open Neovim Configuration      SPC f c'}, command = ':e ~/.config/nvim/init.lua'},
}
-- Icons from https://www.nerdfonts.com/cheat-sheet

-- Telescope Config
require('telescope').setup {
  defaults = {
    prompt_prefix = '  ',
    selection_caret = '  ',
    winblend = 10,
  },
}

-- AutoSave config
require('autosave').setup(
  {
    enabled = true,
    execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
    events = {"InsertLeave", "TextChanged"},
    conditions = {
        exists = true,
        filetype_is_not = {},
        modifiable = true
    },
    write_all_buffers = false,
    on_off_commands = true,
    clean_command_line_interval = 0,
    debounce_delay = 135
  }
)

-- Floaterm Config
g.floaterm_wintype = 'split'
g.floaterm_height = 0.3
g.floaterm_autoclose = 1
cmd 'autocmd FileType javascript nnoremap <buffer> <leader>c :FloatermNew node %<CR>'
cmd 'autocmd FileType c nnoremap <buffer> <leader>c :FloatermNew --autoclose=0 gcc % && ./a.out && rm ./a.out <CR>'
cmd 'autocmd FileType python nnoremap <buffer> <leader>c :FloatermNew python3 %<CR>'
cmd 'autocmd FileType cpp nnoremap <buffer> <leader>c :FloatermNew --autoclose=0 g++ % && ./a.out && rm ./a.out<CR>'
cmd 'autocmd FileType html nnoremap <buffer> <leader>c :FloatermNew live-server<CR>'
cmd 'autocmd FileType scss nnoremap <buffer> <leader>c :FloatermNew compile-sass<CR>'
cmd 'autocmd FileType markdown nnoremap <buffer> <leader>c :FloatermNew mlp %<CR>'

-- Colorizer Config
require('colorizer').setup()
