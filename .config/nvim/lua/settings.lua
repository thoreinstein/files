local utils = require('utils')

local cmd = vim.cmd
local indent = 2

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
