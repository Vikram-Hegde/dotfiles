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
g.nvim_tree_gitignore = true

-- Color Scheme
--require('material').set()
-- g.material_style="darker"

g.neon_style="default"
cmd[[colorscheme neon]]

-- Lualine Config
require('lualine').setup {
	options = {
		theme = 'neon'
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
    a = {description = {'  Recently Opened Files          SPC f r'}, command = 'Telescope oldfiles'},
    b = {description = {'  Find File                       SPC o'}, command = 'Telescope find_files'},
    c = {description = {'  Find Word                      SPC f g'}, command = 'Telescope live_grep'},
    d = {description = {'  Open Project                   SPC f m'}, command = 'Telescope marks'},
    e = {description = {'  Open Neovim Configuration      SPC f P'}, command = ':e ~/.config/nvim/init.lua'},
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
cmd 'autocmd FileType c nnoremap <buffer> <leader>c :FloatermNew gcc % && ./a.out <CR>'
cmd 'autocmd FileType python nnoremap <buffer> <leader>c :FloatermNew python3 %<CR>'
cmd 'autocmd FileType cpp nnoremap <buffer> <leader>c :cd %:p:h <bar> :FloatermNew --autoclose=0 g++ % && ./a.out && rm ./a.out<CR>'
cmd 'autocmd FileType html nnoremap <buffer> <leader>c :FloatermNew live-server<CR>'
-- cmd 'autocmd FileType lua nnoremap <buffer> <leader>c :FloatermNew --autoclose=0 lua %<CR>'

-- Colorizer Config
require('colorizer').setup()
