local packer = require("packer")

vim.opt.path:append('**')
vim.opt.wildmode='longest,full'
vim.opt.wildignore = {
	'.git',
	'node_modules',
}
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.g.mapleader = ","

packer.startup(function(use)
	use 'wbthomason/packer.nvim'
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
	use 'mfussenegger/nvim-jdtls'
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
