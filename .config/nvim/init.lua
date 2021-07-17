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
  vim.cmd('augroup ' .. name)
  vim.cmd('autocmd!')
  for _, autocmd in ipairs(autocmds) do
    vim.cmd('autocmd ' .. table.concat(autocmd, ' '))
  end
  vim.cmd('augroup END')
end

-- map leader to space
vim.g['mapleader'] = ' '

local cmd = vim.cmd
local fn = vim.fn
local indent = 2
local execute = vim.api.nvim_command

cmd 'syntax enable'
cmd 'filetype plugin indent on'

utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'tabstop', indent)
utils.opt('o', 'hidden', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'joinspaces', false)
utils.opt('o', 'scrolloff', 4 )
utils.opt('o', 'shiftround', true)
utils.opt('o', 'sidescrolloff', 8 )
utils.opt('o', 'smartcase', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'termguicolors', true)
utils.opt('o', 'wildmode', 'list:longest')
utils.opt('w', 'list', true)
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)
utils.opt('w', 'wrap', false)

-- Install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

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
end)

cmd 'colorscheme nord'

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

utils.opt('o', 'completeopt', 'menuone,noinsert,noselect')

vim.cmd [[set shortmess+=c]]

-- <Tab> to navigate the completion menu
utils.map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
utils.map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

utils.create_augroup({{'BufEnter', '*', 'lua require\'completion\'.on_attach()'}}, 'complete')

-- require'compe'.setup {
--   enabled = true;
--   autocomplete = true;
--   debug = false;
--   min_length = 2;
--   preselect = 'enable';
--   throttle_time = 80;
--   source_timeout = 200;
--   incomplete_delay = 400;
--   max_abbr_width = 100;
--   max_kind_width = 100;
--   max_menu_width = 100;
--   documentation = true;

--   source = {
--     path = true;
--     buffer = true;
--     nvim_lsp = true;
--     nvim_lua = true;
--     spell = true;
--     nvim_treesitter = true;
--   };
-- }

-- vim.cmd [[
-- inoremap <silent><expr> <C-Space> compe#complete()
-- inoremap <silent><expr> <CR>      compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })
-- inoremap <silent><expr> <C-e>     compe#close('<C-e>')
-- inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
-- inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
-- ]]

-- vim.cmd 'autocmd BufEnter COMMIT_EDITMSG set colorcolumn=50'
