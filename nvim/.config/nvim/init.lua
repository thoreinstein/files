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
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.incsearch = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 1000
vim.opt.hidden = true
vim.opt.scrolloff = 10
vim.opt.clipboard = "unnamedplus"

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
	use 'tpope/vim-surround'
	use 'tpope/vim-commentary'
	use 'tpope/vim-unimpaired'
	use 'glepnir/lspsaga.nvim'
	use 'mfussenegger/nvim-jdtls'
	use 'ThePrimeagen/harpoon'
	use 'andymass/vim-matchup'
	use 'L3MON4D3/LuaSnip'
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-nvim-lua"
	use "hrsh7th/cmp-nvim-lsp"
	use "saadparwaiz1/cmp_luasnip"
    use "tpope/vim-fugitive"
    use "github/copilot.vim"
end)

-- lua/janders223
require("janders223")
