local cmd = vim.cmd
local fn = vim.fn
local indent = 2
local execute = vim.api.nvim_command

local utils = { }

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

function utils.opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then scopes['o'][key] = value end
end

function utils.map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function utils.create_augroup(autocmds, name)
  cmd('augroup ' .. name)
  cmd('autocmd!')
  for _, autocmd in ipairs(autocmds) do
    cmd('autocmd ' .. table.concat(autocmd, ' '))
  end
  cmd('augroup END')
end

-- map leader to space
vim.g['mapleader'] = ' '

cmd 'syntax enable'
cmd 'filetype plugin indent on'

utils.opt('o', 'number', true)                  -- show line numbers
utils.opt('o', 'backspace', 'indent,eol,start') -- make backspace more powerful
utils.opt('o', 'showcmd', true)                 -- show what I am typing
utils.opt('o', 'splitbelow', true)              -- horizontal splits go below
utils.opt('o', 'splitright', true)              -- vertical splits go right
utils.opt('o', 'encoding', 'utf-8')             -- default encoding is utf-8
utils.opt('o', 'autowrite', true)               -- auto save before :next, :make etc.
utils.opt('o', 'autoread', true)                -- auto read changed files
utils.opt('o', 'laststatus', 2)                 -- always show status bar
utils.opt('o', 'hidden', true)                  -- don't abandon hidden buffers
utils.opt('o', 'incsearch', true)               -- show search matches while typing
utils.opt('o', 'hlsearch', true)                -- highlight found searches
utils.opt('o', 'ignorecase', true)              -- search case insensitive
utils.opt('o', 'smartcase', true)               -- only when a search has a capital
utils.opt('o', 'conceallevel', 0)               -- don't hide markdown
utils.opt('o', 'termguicolors', true)

-- handle long lines nicely
utils.opt('o', 'wrap', true)
utils.opt('o', 'textwidth', 80)
utils.opt('o', 'formatoptions', 'qrn1')

-- apply indentation to the next line
utils.opt('o', 'autoindent', true)
utils.opt('o', 'smartindent', true)
cmd [[set complete-=i]]
utils.opt('o', 'showmatch', true)
utils.opt('o', 'smarttab', true)

utils.opt('o', 'tabstop', 4)
utils.opt('o', 'shiftwidth', 4)
utils.opt('o', 'expandtab', true)
utils.opt('o', 'shiftround', true)
cmd [[set nrformats-=octal]]

utils.opt('o', 'ttimeout', true)
utils.opt('o', 'ttimeoutlen', 10)

utils.opt('o', 'complete', '.,w,b,u,t')
utils.opt('o', 'completeopt', 'longest,menuone,noinsert')

utils.opt('o', 'scrolloff', 1 )
utils.opt('o', 'sidescrolloff', 5 )

utils.opt('o', 'wildmode', 'list:full')
cmd [[set wildignore+=.hg,.git,.svn]]
cmd [[set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg]]
cmd [[set wildignore+=*.sw?]]
cmd [[set wildignore+=*.DS_Store]]
cmd [[set wildignore+=go/pkg]]
cmd [[set wildignore+=go/bin]]

-- Install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
cmd [[packadd packer.nvim]]

require('packer').startup(function()
use {'wbthomason/packer.nvim', opt = true}    -- paq-nvim manages itself
use 'dracula/vim'
use 'nvim-treesitter/nvim-treesitter'
use 'neovim/nvim-lspconfig'
-- use 'hrsh7th/nvim-compe'
use 'LnL7/vim-nix'
use 'christoomey/vim-tmux-navigator'
use 'tpope/vim-commentary'
use 'tpope/vim-surround'
use 'godlygeek/tabular'
use 'Raimondi/delimitMate'
use 'sbdchd/neoformat'
use 'tpope/vim-unimpaired'
use 'tpope/vim-repeat'
use 'vmchale/dhall-vim'
use 'arcticicestudio/nord-vim'
use 'kabouzeid/nvim-lspinstall'
use 'nvim-lua/completion-nvim'
use 'glepnir/lspsaga.nvim'
use 'Shougo/neosnippet.vim'
use 'Shougo/neosnippet-snippets'
end)

cmd 'colorscheme dracula'

-- Filetypes
cmd 'au BufEnter COMMIT_EDITMSG set colorcolumn=50'
cmd 'au BufEnter *.tf set ft=terraform'
cmd 'au BufNewFile,BufRead *.tf set ft=terraform noet ts=4 sw=4 sts=4'
cmd 'au BufNewFile,BufRead *.js set noet ts=2 sw=2 sts=2'

-- Normal Mode Maps
utils.map('n', '<leader>c', '"+y')
utils.map('n', '<Space><Space>', '<cmd>:nohls<CR>')

-- LSP Maps
utils.map('n', '[e', ':Lspsaga diagnostic_jump_prev<CR>')
utils.map('n', ']e', ':Lspsaga diagnostic_jump_next<CR>')
utils.map('n', '<leader>ga', ':Lspsaga code_action<CR>')
utils.map('n', '<leader>gd', ':Lspsaga preview_definition<CR>')
utils.map('n', '<leader>gf', ':Lspsaga lsp_finder<CR>')
utils.map('n', '<leader>gh', ':Lspsaga hover_doc<CR>')
utils.map('n', '<leader>gr', ':Lspsaga rename<CR>')

-- Insert Mode Maps
utils.map('i', 'jk', '<esc>')
utils.map('i', '<C-u>', '<C-g>u<C-u>')
utils.map('i', '<C-w>', '<C-g>u<C-w>')

local saga = require 'lspsaga'
saga.init_lsp_saga({
  code_action_icon = '💡'
})

local lsp = require 'lspconfig'

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = vim.fn.stdpath('data')..'/lspinstall/lua/sumneko-lua/extension/server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"
--/Users/kon8522/.local/share/nvim/lspinstall/lua/sumneko-lua/extension/server/bin/macOS

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

lsp.bashls.setup{}
lsp.dhall_lsp_server.setup{}
lsp.dockerls.setup{}
lsp.gopls.setup{}
lsp.hls.setup{}
lsp.java_language_server.setup{
  cmd= {'lang_server_mac.sh'}
}
lsp.jsonls.setup{}
lsp.rnix.setup{}
lsp.terraformls.setup{}
lsp.tflint.setup{}
lsp.tsserver.setup{}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.html.setup{
  cmd = {'html-languageserver', '--stdio'},
  capabilities = capabilities,
}

local ts = require 'nvim-treesitter.configs'
ts.setup {
  ensure_installed = {
    'bash',
    'comment',
    'css',
    'dockerfile',
    'go',
    'gomod',
    'hcl',
    'html',
    'java',
    'javascript',
    'json',
    'nix',
    'regex',
    'toml',
    'yaml'
  },
  highlight = {enable = true},
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {enable = true},
}

utils.create_augroup({
  {'BufWritePre', '*', 'undojoin', '|', 'Neoformat'}
}, 'neoformat')

vim.g['neoformat_enabled_javascript'] = { 'prettier' }


cmd [[set shortmess+=c]]

-- <Tab> to navigate the completion menu
utils.map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
utils.map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

utils.create_augroup({{'BufEnter', '*', 'lua require\'completion\'.on_attach()'}}, 'complete')
