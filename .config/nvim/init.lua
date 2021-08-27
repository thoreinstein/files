local packer = require("packer")

vim.g.mapleader = ","

packer.startup(function(use)
	use 'wbthomason/packer.nvim'
	use {'dracula/vim', as = 'dracula'}
	use 'gruvbox-community/gruvbox'
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-compe'
	use 'tpope/vim-surround'
	use 'tpope/vim-commentary'
	use 'tpope/vim-unimpaired'
	use 'glepnir/lspsaga.nvim'
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup {
				auto_open = true,
				auto_close = true,
			}
		end
	}
end)

-- lua/janders223
require("janders223")
