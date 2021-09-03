--[[
           __            _
    ____  / /_  ______ _(_)___  _____
   / __ \/ / / / / __ `/ / __ \/ ___/
  / /_/ / / /_/ / /_/ / / / / (__  )
 / .___/_/\__,_/\__, /_/_/ /_/____/
/_/            /____/

--]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

	-- Looks
	use 'marko-cerovac/material.nvim'
	use 'navarasu/onedark.nvim'
	use 'glepnir/dashboard-nvim'
	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons'
	}
	use 'hoob3rt/lualine.nvim'
	use {
		'kdheepak/tabline.nvim',
		config = function()
			require'tabline'.setup {enable = false}
		end
	}

	-- Telescope
	use 'nvim-lua/plenary.nvim'
	use 'nvim-lua/popup.nvim'
	use 'nvim-telescope/telescope.nvim'

	-- Handy Utils
	use 'Pocco81/AutoSave.nvim'
	use 'jiangmiao/auto-pairs'
	use 'tpope/vim-surround'
	use 'tpope/vim-commentary'
	use 'akinsho/toggleterm.nvim'
	use 'norcalli/nvim-colorizer.lua'
	use { 'gregsexton/MatchTag', ft = {'html'} }
	use 'ThePrimeagen/vim-be-good' -- Game
	use 'wakatime/vim-wakatime' -- Code statistics
	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		},
		config = function()
			require('gitsigns').setup()
		end
	}

	-- Language Support
	use { 'neoclide/coc.nvim', branch = 'release' }
	use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install', cmd = 'MarkdownPreview', ft = { 'markdown' }}
	use { 'prettier/vim-prettier', run = "npm install" }
	use 'sheerun/vim-polyglot'
end)
