---@diagnostic disable: undefined-global
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

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons'
	}
	use 'marko-cerovac/material.nvim'
	use 'hoob3rt/lualine.nvim'
	use {
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}
	use 'glepnir/dashboard-nvim'
	use 'Pocco81/AutoSave.nvim'
	use 'jiangmiao/auto-pairs'
	use 'tpope/vim-surround'
	use 'tpope/vim-commentary'
	use 'voldikss/vim-floaterm'
	use 'norcalli/nvim-colorizer.lua'
	use {
		'neoclide/coc.nvim', branch = 'release'
	}
	use {
		'kdheepak/tabline.nvim',
		config = function()
			require'tabline'.setup {enable = false}
		end,
		requires = {'hoob3rt/lualine.nvim', 'kyazdani42/nvim-web-devicons'}
	}
	use 'rafamadriz/neon'
	use 'sheerun/vim-polyglot'
end)
