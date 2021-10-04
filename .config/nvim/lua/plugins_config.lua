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
g.nvim_tree_auto_open = 0 -- opens the tree when typing `vim $DIR` or `vim`
g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' } -- empty by default, don't auto open tree on specific filetypes.
g.nvim_tree_update_cwd = 1 -- will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }


-- vim.g.onedark_style = 'darker'
-- require('onedark').setup()

local catppuccino = require("catppuccino")

-- configure it
catppuccino.setup(
    {
		colorscheme = "soft_manilo",
		term_colors = true,
		styles = {
			comments = "italic",
			functions = "italic",
			keywords = "italic",
			strings = "NONE",
			variables = "NONE",
		},
		integrations = {
			treesitter = false,
			native_lsp = {
				enabled = false,
				virtual_text = {
					errors = "italic",
					hints = "italic",
					warnings = "italic",
					information = "italic",
				},
				underlines = {
					errors = "underline",
					hints = "underline",
					warnings = "underline",
					information = "underline",
				}
			},
			lsp_trouble = false,
			lsp_saga = false,
			gitgutter = false,
			gitsigns = false,
			telescope = true,
			nvimtree = {
				enabled = true,
				show_root = true,
			},
			which_key = false,
			indent_blankline = {
				enabled = false,
				colored_indent_levels = false,
			},
			dashboard = false,
			neogit = false,
			vim_sneak = false,
			fern = false,
			barbar = false,
			bufferline = false,
			markdown = false,
			lightspeed = false,
			ts_rainbow = false,
			hop = false,
		}
	}
)
vim.cmd[[colorscheme catppuccino]]

-- Lualine Config
require('lualine').setup {
	options = {
		theme = 'catppuccino'
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
    execution_message = "Saved",
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

-- ToggleTerm Config
require("toggleterm").setup {
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 12
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_terminals = true,
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = true, -- close the terminal window when the process exits
}

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
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
cmd 'autocmd FileType markdown nnoremap <buffer> <leader>c :MarkdownPreviewToggle<CR>'

-- Colorizer Config
require('colorizer').setup()

-- NetRW config
g.netrw_liststyle = 3
g.netrw_banner = 0
g.netrw_winsize = 20

-- AutoPairs Config
require('nvim-autopairs').setup{}

-- Format Config
require "format".setup {
    ["*"] = {
        {cmd = {"sed -i 's/[ \t]*$//'"}} -- remove trailing whitespace
    },
    lua = {
        {
            cmd = {
                function(file)
                    return string.format("luafmt -l %s -w replace %s", vim.bo.textwidth, file)
                end
            }
        }
    },
    javascript = {
        {cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}
    },
    html = {
        {cmd = {"prettier -w"}}
    },
    markdown = {
        {cmd = {"prettier -w"}}
    },
    cpp = {
      { cmd = {"clang-format %"}}
    },
    c = {
      { cmd = {"clang-format %"}}
    },
    scss = {
      { cmd = {"prettier -w"}}
    }
}
