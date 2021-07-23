local present, _ = pcall(require, 'packerInit')
local packer

if present then
    packer = require 'packer'
else
    return false
end

local use = packer.use

return packer.startup(function()
    use 'wbthomason/packer.nvim'
    use 'dracula/vim'

    -- use 'sbdchd/neoformat'
    -- use 'tpope/vim-repeat'

    use {'nvim-lua/completion-nvim',
        event = "InsertEnter"
    }

    use {'Shougo/neosnippet.vim',
        after = 'completion-nvim'
    }

    use {'Shougo/neosnippet-snippets',
        after = 'neosnippet.vim'
    }

    use {'tpope/vim-surround',
        event = 'BufRead'
    }

    use {'tpope/vim-commentary',
        event = 'BufRead'
    }

    use {'mattn/emmet-vim',
        event = 'BufRead'
    }

    use {'lukas-reineke/indent-blankline.nvim',
        event = 'BufRead',
        setup = function()
            require('plugins.others').blankline()
        end
    }

    use {'glepnir/lspsaga.nvim',
        after = "nvim-lspconfig",
        config = function ()
            require 'plugins.lspsaga'
        end
    }

    use {'nvim-lua/lsp_extensions.nvim',
        after = "nvim-lspconfig",
    }

    use {'jghauser/mkdir.nvim',
        event = 'BufRead',
        config = function()
            require('mkdir')
        end
    }

    use {'steelsojka/pears.nvim',
        event = 'BufRead',
        config = function()
            require 'plugins.pears'
        end
    }

    use {'nvim-treesitter/nvim-treesitter',
        event = "BufRead",
        config = function ()
            require 'plugins.treesitter'
        end
    }

    use {'p00f/nvim-ts-rainbow',
        after = "nvim-treesitter"
    }

    use { 'kabouzeid/nvim-lspinstall',
            event = 'BufRead'
        }

    use {'neovim/nvim-lspconfig',
        after = "nvim-lspinstall",
        config = function()
            require 'plugins.lspconfig'
        end
    }

    use {'tweekmonster/startuptime.vim',
        cmd = 'StartupTime'
    }
end)
