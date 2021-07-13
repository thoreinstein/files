local utils = require('utils')

-- Normal Mode Maps
utils.map('n', '<leader>c', '"+y')
utils.map('n', '<Space><Space>', '<cmd>:nohls<CR>')

-- LSP Maps
utils.map('n', '<space>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
utils.map('n', '<space>;', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
utils.map('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
utils.map('n', '<space>d', '<cmd>lua vim.lsp.buf.definition()<CR>')
utils.map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
utils.map('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
utils.map('n', '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
utils.map('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>')
utils.map('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')

-- Insert Mode Maps
utils.map('i', 'jk', '<esc>')
utils.map('i', '<C-u>', '<C-g>u<C-u>')
utils.map('i', '<C-w>', '<C-g>u<C-w>')
