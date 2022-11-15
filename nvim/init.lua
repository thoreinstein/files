local packer = require("packer")

vim.opt.path:append('**')
vim.opt.wildmode = 'longest,full'
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
-- vim.opt.termguicolors = true

vim.g.mapleader = ","

packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'arcticicestudio/nord-vim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'neovim/nvim-lspconfig'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'tpope/vim-unimpaired'
    use 'glepnir/lspsaga.nvim'
    use 'ThePrimeagen/harpoon'
    use 'andymass/vim-matchup'
    use 'L3MON4D3/LuaSnip'
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp"
    use "saadparwaiz1/cmp_luasnip"
    use 'f-person/git-blame.nvim'
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use 'hashivim/vim-terraform'
    use 'junegunn/tabularize'
    use 'christoomey/vim-tmux-navigator'
    use {
        'sudormrfbin/cheatsheet.nvim',

        requires = {
            {'nvim-telescope/telescope.nvim'},
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
        }
    }
    use 'rcarriga/nvim-notify'
    use({
        "folke/noice.nvim",
        config = function()
            require("noice").setup({
                -- add any options here
            })
        end,
        requires = {
            "MunifTanjim/nui.nvim",
        }
    })
    use {'akinsho/git-conflict.nvim', tag = "*", config = function()
        require('git-conflict').setup()
    end}
    use 'glepnir/indent-guides.nvim'
    use 'echasnovski/mini.trailspace'
    use 'haringsrob/nvim_context_vt'
    use 'p00f/nvim-ts-rainbow'
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
end)

-- lua/janders223
require("janders223")
