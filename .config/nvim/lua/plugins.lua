local fn = vim.fn
local packer_bootstrap
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap =
		fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

vim.cmd(
	[[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]
)

local theme = "github-nvim-theme"

return require("packer").startup(
	function(use)
		-- Plugin List
		use {"wbthomason/packer.nvim"}

		use {
			"neoclide/coc.nvim",
			branch = "release",
			event = "BufWinEnter",
			after = theme
		}

		-- Themes

		-- use {
		-- 	"navarasu/onedark.nvim",
		-- 	event = "UIEnter",
		-- 	config = function()
		-- 		require('onedark').setup {
		-- 		style = 'darker',
		-- 		transparent = true
		-- 	}
		-- 	 	require('onedark').load()
		-- 	end
		-- }
		--
		use {
			"projekt0n/github-nvim-theme",
			event = "UIEnter",
			config = function()
				require("github-theme").setup(
					{
						transparent = true,
						theme_style = "dimmed",
						hide_end_of_buffer = true,
					}
				)
			end
		}

		--
		-- use {
		-- 	'sainnhe/everforest',
		-- 	event = 'VimEnter',
		-- 	config = function ()
		-- 		// TODO
		-- 	end
		-- }

		-- use({
		-- 	"catppuccin/nvim",
		-- 	as = "catppuccin",
		-- 	config = function ()
		-- 		require('catppuccin').setup {
 	--  	 	 	 	transparent_background = false,
		-- 			term_colors = false
		-- 		}
		-- 	vim.cmd[[colorscheme catppuccin]]
		-- 	end
		-- })
		--

		-- Handy Utils

		use {
			'tidalcycles/vim-tidal'
		}

		use {
			"numToStr/Comment.nvim",
			after = theme,
			config = function()
				require "Comment".setup()
			end
		}

		-- use {
		-- 	'lewis6991/gitsigns.nvim',
		-- 	requires = {
		-- 		'nvim-lua/plenary.nvim'
		-- 	},
		-- 	after = theme,
		-- 	tag = 'release', -- To use the latest release
		-- 	config = function()
		-- 		require'gitsigns'.setup()
		-- 	end
		-- }

		use {
			"norcalli/nvim-colorizer.lua",
			after = theme,
			ft = {"html", "css", "js", "sass", "scss"},
			cmd = "ColorizerToggle",
			config = function()
				require "colorizer".setup {}
			end
		}

		use {
			"Pocco81/AutoSave.nvim",
			config = function()
				require "plugin_config.autosave"
			end
		}

		use {"jiangmiao/auto-pairs", event = "BufWinEnter"}

		use {
			"mhartington/formatter.nvim",
			cmd = "Format",
			event = "BufWrite",
			config = function()
				require "plugin_config.formatconfig"
			end
		}

		use {
			"blackCauldron7/surround.nvim",
			event = "InsertEnter",
			config = function()
				-- sandwich replaces substitue command (s) in case
				-- needed change to surround
				require "surround".setup {mappings_style = "sandwich"}
			end
		}

		use {
			"akinsho/toggleterm.nvim",
			event = "BufWinEnter",
			config = function()
				require "plugin_config.toggleterm"
			end
		}

		use {
			"nvim-telescope/telescope.nvim",
			requires = "nvim-lua/plenary.nvim",
			event = "BufWinEnter",
			config = function()
				require "plugin_config.telescope"
			end
		}

		-- Extra stuffs (not important)
		use {
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			after = theme,
			config = function()
				require "plugin_config.treesitter"
			end
		}

		use {
			"abecodes/tabout.nvim",
			config = function()
				require "plugin_config.tabout"
			end,
			wants = "nvim-treesitter",
			event = "InsertEnter"
		}

		use {
			"kyazdani42/nvim-web-devicons",
			after = theme
		}

		use {
			"nvim-lualine/lualine.nvim",
			after = "nvim-web-devicons",
			config = function()
				require "plugin_config.lualine"
			end
		}

		use {
			"akinsho/bufferline.nvim",
			after = "nvim-web-devicons",
			config = function()
				require "plugin_config.bufferline"
			end
		}

		-- Automatically set up your configuration after cloning packer.nvim
		-- Put this at the end after all plugins
		if packer_bootstrap then
			require "packer".sync()
		end
	end
)
