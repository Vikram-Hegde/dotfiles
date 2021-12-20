local fn = vim.fn
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
			event = "BufWinEnter"
		}

		-- Themes
		use {
			"navarasu/onedark.nvim",
			event = "UIEnter"
			-- config = function() vim.g.onedark_style = 'darker' vim.cmd[[ colorscheme onedark ]] end
		}

		use {
			"projekt0n/github-nvim-theme",
			event = "UIEnter",
			config = function()
				require("github-theme").setup(
					{
						transparent = "false",
						theme_style = "dark_default"
					}
				)
			end
		}

		-- use {
		-- 	'sainnhe/everforest',
		-- 	event = 'VimEnter',
		-- 	config = function ()
		-- 		// TODO
		-- 	end
		-- }

		-- use {
		-- 	'Pocco81/Catppuccino.nvim',
		-- 	event = 'VimEnter',
		-- 	config = function ()
		-- 		// TODO
		-- 	end
		-- }

		-- Handy Utils

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
		-- 	tag = 'release', -- To use the latest release
		-- 	event = 'InsertEnter',
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
			"SmiteshP/nvim-gps",
			after = "nvim-treesitter",
			requires = "nvim-treesitter/nvim-treesitter",
			config = function()
				require "plugin_config.gps"
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
			after = "nvim-gps",
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
