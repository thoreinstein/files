return require('packer').startup(function()
use {'wbthomason/packer.nvim', opt = true}    -- paq-nvim manages itself
use {'dracula/vim'}
use {'nvim-treesitter/nvim-treesitter'}
use {'neovim/nvim-lspconfig'}
use {'hrsh7th/nvim-compe'}
use {'LnL7/vim-nix'}
use {'christoomey/vim-tmux-navigator'}
use {'tpope/vim-commentary'}
use {'tpope/vim-surround'}
use {'godlygeek/tabular'}
use {'Raimondi/delimitMate'}
use {'sbdchd/neoformat'}
use {'tpope/vim-unimpaired'}
use {'tpope/vim-repeat'}
use {'vmchale/dhall-vim'}
end)
