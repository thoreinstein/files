return require("packer").startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'arcticicestudio/nord-vim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},
        {'hrsh7th/cmp-nvim-lsp-signature-help'},

        -- Snippets
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},
      }
    }
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'tpope/vim-unimpaired'
    use 'tpope/vim-repeat'
    use 'glepnir/lspsaga.nvim'
    use 'ThePrimeagen/harpoon'
    use 'andymass/vim-matchup'
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
    use 'windwp/nvim-autopairs'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        "someone-stole-my-name/yaml-companion.nvim",
        requires = {
            { "neovim/nvim-lspconfig" },
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope.nvim" },
        },
        config = function()
            require("telescope").load_extension("yaml_schema")
        end,
    }
    use 'folke/lsp-colors.nvim'
    use({
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    })
    use({
        'j-hui/fidget.nvim',
        config = function() require('fidget').setup{} end
    })
    use 'github/copilot.vim'
    use 'Afourcat/treesitter-terraform-doc.nvim'
    use 'ThePrimeagen/git-worktree.nvim'
    use 'simrat39/rust-tools.nvim'
end)
