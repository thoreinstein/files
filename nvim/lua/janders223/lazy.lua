vim.g.mapleader = ","

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    'arcticicestudio/nord-vim',
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
    {'nvim-telescope/telescope.nvim',
	    dependencies = {
		    'nvim-lua/plenary.nvim'
	    }
    },
    {
      'VonHeikemen/lsp-zero.nvim',
      dependencies = {
        -- LSP Support
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- Autocompletion
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp-signature-help',

        -- Snippets
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets',
      }
    },
    'tpope/vim-surround',
    'tpope/vim-commentary',
    'tpope/vim-unimpaired',
    'tpope/vim-repeat',
    'glepnir/lspsaga.nvim',
    'ThePrimeagen/harpoon',
    'andymass/vim-matchup',
    'f-person/git-blame.nvim',
    {
        "folke/trouble.nvim",
        dependencies = { "kyazdani42/nvim-web-devicons" }
    },
    { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },
    'hashivim/vim-terraform',
    'junegunn/tabularize',
    'christoomey/vim-tmux-navigator',
    {
        'sudormrfbin/cheatsheet.nvim',

        dependencies = {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
        }
    },
    'rcarriga/nvim-notify',
    {
        "folke/noice.nvim",
        config = function()
            require("noice").setup({
                -- add any options here
            })
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
        }
    },
    -- {'akinsho/git-conflict.nvim', tag = "*", config = function()
    --     require('git-conflict').setup()
    -- end},
    'glepnir/indent-guides.nvim',
    'echasnovski/mini.trailspace',
    'haringsrob/nvim_context_vt',
    'p00f/nvim-ts-rainbow',
    'windwp/nvim-autopairs',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
    },
    {
        "someone-stole-my-name/yaml-companion.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("telescope").load_extension("yaml_schema")
        end,
    },
    'folke/lsp-colors.nvim',
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    },
    {
        'j-hui/fidget.nvim',
        config = function() require('fidget').setup{} end
    },
    'github/copilot.vim',
    'Afourcat/treesitter-terraform-doc.nvim',
    'simrat39/rust-tools.nvim'
})
