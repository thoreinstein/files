local packer = require("packer")

packer.startup(function(use)
	use 'wbthomason/packer.nvim'
	use {'dracula/vim', as = 'dracula'}
end)

vim.cmd [[
augroup dracula
    autocmd!
    autocmd ColorScheme dracula highlight Normal guibg=NONE ctermbg=NONE
    autocmd ColorScheme dracula highlight Type guibg=NONE ctermbg=NONE
augroup END
colorscheme dracula
inoremap jk <esc>
]]

